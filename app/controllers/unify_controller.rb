class UnifyController < ApplicationController

  layout 'index'

  def index
    # Expected URL formats
    # /bureau_name  -> Route for bureau dashboards
    # /app/xxx - for all other app specific routes
    dynamic_route = params[:dynamic_route]
    @ui_view = 'index'
    if (dynamic_route.present? && dynamic_route == 'app')
      dynamic_action = params[:dynamic_action]
      if (dynamic_action.present? && dynamic_action == 'set_locale')
        action_param = params[:action_param]
        if (action_param.present?)
          set_locale(action_param)
        end
      end
    elsif (dynamic_route.present? && dynamic_route.length > 0)
      @ui_view = 'bureau'
    end
    render :template => '/index', :locals => {ui_view: @ui_view}
  end

  # Entry point method for all data calls from front-end
  def services
    Rails.logger.debug 'Inside service'
    action = params[:do]
    result_json = {}
    case action
      when 'login'
        Rails.logger.debug 'Processing login'
        result_json = login
      when 'register'
        Rails.logger.debug 'Processing registration'
        result_json = register
      else
        Rails.logger.warn 'Unsupported service call'
    end
    render json: result_json
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
      session[:user_name] = user.first_name
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
      user.locale = get_locale
      user.save!
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

  private

  def user_params
    params.require(:unify_user).permit(:user_id, :email, :password, :first_name, :last_name, :user_type, :organization_name)
  end
end
