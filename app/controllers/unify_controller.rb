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

end
