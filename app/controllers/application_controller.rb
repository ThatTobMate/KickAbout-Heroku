class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'index', :controller => '/static', :only_path => false, :protocol => 'http')
   
    if request.referer == sign_in_url
      super
    else
      sign_in_url
    end
  end
  
end
