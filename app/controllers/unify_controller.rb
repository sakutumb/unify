class UnifyController < ApplicationController

  layout 'index'

  def index
    render :template => '/index'
  end

  def home
    render :template => '/home'
  end
end
