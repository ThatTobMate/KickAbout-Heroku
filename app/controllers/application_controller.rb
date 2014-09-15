class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, except: [:index, :sign_up]

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'index', :controller => '/static', :only_path => false, :protocol => 'http')
   
    if request.referer == sign_in_url
      super
    else
      sign_in_url
    end
  end
  
end
