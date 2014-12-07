class UnifyController < ApplicationController

  layout 'index'

  def index
    # Expected URL formats
    # /bureau_name  -> Route for bureau dashboards
    # /app/xxx - for all other app specific routes
    dynamic_route = params[:dynamic_route]
    @ui_view = 'index'
    if(dynamic_route.present? && dynamic_route == 'app')
      dynamic_action = params[:dynamic_action]
      if(dynamic_action.present? && dynamic_action == 'set_locale')
        action_param = params[:action_param]
        if(action_param.present?)
          set_locale(action_param)
        end
      end
    elsif(dynamic_route.present? && dynamic_route.length > 0)
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
      when 'login'    #compare to 1
        Rails.logger.debug 'Processing login'
        result_json = login
      else
        Rails.logger.warn 'Unsupported service call'
    end
    render json: result_json
  end

  def login
    Rails.logger.debug 'Inside login service'
    user_name = params['userName']
    password = params['password']
    # Query database
    user = FactUser.where user_name: user_name, password: password
    result_json = {
        :result  => 'failure',
        :data    => {},
        :msg     => 'Invalid username or password'
    }
    if(user.present?)
      Rails.logger.debug 'Valid user !'
      result_json = {
          :result  => 'success',
          :data    => user,
          :msg     => 'Valid User'
      }
    end
    return result_json
  end

end
