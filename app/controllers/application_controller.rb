class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :current_user_is, :readable_role

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !!current_user
  end
  def current_user_is(role)
    return false if !logged_in?
    
    current_user.role === role
  end
  def readable_role(number)
    case
    when number == 1
      return 'Admin'
    when number == 2
      return 'Superintendent'
    when number ==3
      return 'Subcontractor'
    end
  end
end
