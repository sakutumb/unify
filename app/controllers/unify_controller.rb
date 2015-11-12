class UnifyController < ApplicationController

  before_filter :check_user_session

  layout 'index'

  def index
    # Expected URL formats
    # /bureau_name  -> Route for bureau dashboards
    # /app/xxx - for all other app specific routes
    dynamic_route = params[:dynamic_route]
    @ui_view = 'index'
    if (dynamic_route.present? && (dynamic_route == 'app' || (Unify::APP_CONFIG['angular_routes'].include? dynamic_route)))
      dynamic_action = params[:dynamic_action]
      if (dynamic_action.present? && dynamic_action == 'set_locale')
        action_param = params[:action_param]
        if (action_param.present?)
          set_locale(action_param)
        end
      end
    elsif (dynamic_route.present? && dynamic_route.length > 0)
      if (dynamic_route == 'prospect')
        @ui_view = 'prospect'
      elsif (dynamic_route == 'product')
          @ui_view = 'product'  #TODO: Name it correctly
      else
        @ui_view = 'bureau'
      end
    end
    render :template => '/index', :locals => {ui_view: @ui_view}
  end

  # Entry point method for data calls from front-end, inherit code, only for services: login, 
  # register, save_linkedin_profile, get_dim_data.
  # For SoC and keep "fat model skinny controller", other services are implemented 
  # in other controllers. See details in routes.rb and every controller.
  def services
    Rails.logger.debug 'Inside service'
    @result_json = {}
    begin
      action = params[:do]
      case action
        when 'login'
          Rails.logger.debug 'Processing login'
          @result_json = login
        when 'register'
          Rails.logger.debug 'Processing registration'
          @result_json = register
        when 'save_linkedin_profile'
          Rails.logger.debug 'Saving Linkedin Profile'
          @result_json = save_linkedin_profile
        when 'get_dim_data'
          dim_type = params[:dim_type]
          Rails.logger.debug "Getting dimension data - #{dim_type}"
          @result_json = get_dim_data (dim_type)
        when 'get_filter_data'
          filter_data = params[:filter_data]
          columns = params[:columns]
          Rails.logger.debug "Getting Filter data - #{filter_data}"
          @result_json = get_filter_data(filter_data, columns)
        else
          Rails.logger.warn 'Unsupported service call'
      end
    rescue
      Rails.logger.error "Error in service method #{$!}"
    ensure
      render json: @result_json
    end
  end

  # Search method
  def search
    Rails.logger.debug 'Inside search'
    if request.method == 'GET'
      @ui_view = 'search'
      render :template => '/index', :locals => {ui_view: @ui_view}
    elsif request.method == 'POST'
      # Return search results as json - WIll cater to AJAX calls
    end
  end

  def login
    Rails.logger.debug 'Inside login service'
    result_json = {
        :result => 'failure',
        :data => {},
        :msg => 'Invalid username or password'
    }
    user = UnifyUser.find_by_user_id(params[:user_id])
    if user && user.authenticate(params[:password])
      Rails.logger.debug 'Valid Credentials !'
      session[:user] = user.to_json
      Rails.logger.debug 'Valid user !'
      user.password_digest = nil
      result_json = {
          :result => 'success',
          :data => user,
          :msg => 'Valid User'
      }
    end
    Rails.logger.debug 'Invalid Credentials!'
    return result_json
  end

  def register
    Rails.logger.debug 'Inside register service'
    begin
      user = UnifyUser.create(user_params)
      user.locale_id = session[:user_locale_id]
      user.save!
      session[:user] = user.to_json
      result_json = {
          :result => 'success',
          :data => user,
          :msg => 'Registration Successful'
      }
    rescue Exception => ex
      result_json = {
          :result => 'failure',
          :data => {},
          :msg => ex.message
      }
    end
    return result_json
  end

  def save_linkedin_profile
    Rails.logger.debug 'Inside save linked profile'
    begin
      ln_profiles = params[:profiles][:values]

      profiles = [] # linked profile - of the current user and the user's connections' profiles
      positions = [] # linked profile positions - of the current user and the user's connections' profiles

      # Check if the user is already logged in to unify
      if (session[:user].present?)
        user_json = JSON.parse(session[:user])
        ln_profiles.each do |profile|
          if (profile[:id].present? && profile[:id].length > 0)
            profiles.push({
                              :unify_user_id => user_json['user_id'],
                              :linkedin_user_id => profile[:id],
                              :first_name => (profile[:firstName].present?) ? profile[:firstName] : '',
                              :last_name => (profile[:lastName].present?) ? profile[:lastName] : '',
                              :headline => (profile[:headline].present?) ? profile[:headline] : '',
                              :location => (profile[:location].present?) ? profile[:location][:name] : '',
                              :location_country_code => (profile[:location].present? && profile[:location][:country].present?) ? profile[:location][:country][:code] : '',
                              :industry => (profile[:industry].present?) ? profile[:industry] : '',
                              :distance => (profile[:distance].present?) ? profile[:distance] : -1,
                              :picture_url => (profile[:pictureUrl].present?) ? profile[:pictureUrl] : '',
                              :public_profile_url => (profile[:publicProfileUrl].present?) ? profile[:publicProfileUrl] : ''
                          })

            if (profile[:positions].present? && profile[:positions][:values].present?)
              ln_positions = profile[:positions][:values]
              ln_positions.each do |position|
                positions.push({
                                   :linkedin_user_id => profile[:id],
                                   :linkedin_position_id => position[:id],
                                   :title => (position[:title].present?) ? position[:title] : '',
                                   :company_id => (position[:company].present?) ? position[:company][:id] : '',
                                   :company_name => (position[:company].present?) ? position[:company][:name] : '',
                                   :start_date => (position[:startDate].present? && position[:startDate][:year].present? && position[:startDate][:month].present?) ? DateTime.new(position[:startDate][:year], position[:startDate][:month], 1) : nil,
                                   :end_date => (position[:endDate].present? && position[:endDate][:year].present? && position[:endDate][:month].present?) ? DateTime.new(position[:endDate][:year], position[:endDate][:month], 1) : nil,
                                   :is_current => (position[:isCurrent].present?) ? position[:isCurrent] : false
                               })
              end
            end
          end

        end

        # Save the linkedin profiles data to DB
        FactLinkedinProfile.create(profiles)
        # Save the linkedin profiles' position data to DB
        FactLinkedinProfilePosition.create(positions)

        result_json = {
            :result => 'success',
            :data => {},
            :msg => 'LinkedIn profile saved successfully'
        }
      end
    rescue Exception => ex
      result_json = {
          :result => 'failure',
          :data => {},
          :msg => ex.message
      }
    end
    return result_json
  end


  def get_dim_data (dim_type)
    result_set = {}
    begin
      if (dim_type == "religions")
        result_set = DimReligion.where('locale_id = ?', session[:user_locale_id]).select('id, name')
      elsif (dim_type == "languages")
        result_set = DimLanguage.where('locale_id = ?', session[:user_locale_id]).select('id, name')
      elsif (dim_type == "castes")
        result_set = DimCaste.where('locale_id = ?', session[:user_locale_id]).select('id, name')
      end
    rescue
      Rails.logger.error "Error in getting dim data #{$!}"
    ensure
      return result_set
    end
  end

  # Expecting filter_data as a json
  #     {
  #       religion_ids  : [1],
  #       language_ids  : [1,2],
  #       caste_ids     : [2,3]
  #     }
  # columns - String - columns to be selected
  def get_filter_data (filter_data, columns)
    Rails.logger.debug 'Inside get filter method'
    result_set = {}
    begin
      if (columns.present?)
        result_set = UnifyVwReligionLangCasteMapping.where(filter_data.to_hash).select(columns).distinct
      else
        result_set = UnifyVwReligionLangCasteMapping.where(filter_data.to_hash).distinct
      end
    rescue
      Rails.logger.error "Error in getting filter data #{$!}"
    ensure
      return result_set
    end
  end


  def user_params
    params.require(:unify_user).permit(:user_id, :email, :password, :first_name, :last_name, :user_type, :organization_name, :locale_id)
  end

  
end

