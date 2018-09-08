class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged_in?,
                :current_user_is_admin,
                :readable_role,
                :same_user,
                :we_can_edit

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !!current_user
  end
  def same_user(id)
    return false if !logged_in?

    current_user.id === id
  end
  def current_user_is_admin
    return false if !logged_in?
    
    current_user.role === 1
  end
  
  # we can edit a user if
  # we are the user
  # OR we are an admin and they are not an admin (*Admins should not edit other admins unless its their own account)
  def we_can_edit(user)
    return false if !logged_in?

    same_user(user.id) || (current_user_is_admin && user.role != 1) 
  end
  def readable_role(number)
    number = number.to_i
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
