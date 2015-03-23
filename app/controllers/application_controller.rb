class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :set_locale

  # Function to set the locale
  def set_locale(locale_param = Unify::APP_CONFIG['default_locale'])
    #Expect value in the format en-US ..
    #locale_param.downcase!
    #arr = locale_param.split('-') if(locale_param && locale_param.index('-'))
    #locale_param = (arr[0] + '-' + arr[1].upcase) if(arr)
    I18n.locale = locale_param
    session[:user_locale] = I18n.locale
    Unify::SUPPORTED_LOCALES.each do |locale|
      session[:user_locale_id] = locale['id'] if (I18n.locale.to_s.eql? locale['name'])
    end
    [session[:user_locale], session[:user_locale_id]]
  end

=begin
  def set_locale
    locale_param = params[:locale]
    locale_param.downcase!
    arr = locale_param.split('-') if(locale_param && locale_param.index('-'))
    locale_param = arr[0] + '-' + arr[1].upcase if(arr)
    I18n.locale = locale_param || I18n.default_locale
  end
=end

end
