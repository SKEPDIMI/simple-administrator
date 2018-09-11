class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged_in?,
                :current_user_is_admin,
                :readable_role,
                :same_user?,
                :we_can_edit_user?,
                :we_have_permission_for_job?,
                :current_user_has_low_permission_for_job

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !!current_user
  end
  def same_user?(id)
    return false if !logged_in?

    current_user.id === id
  end
  def current_user_is_admin
    return false if !logged_in?
    
    current_user.role === 1
  end
  def current_user_is_project_manager
    return false if !logged_in?
    
    current_user.role === 2
  end

  # can CREATE / EDIT / DESTROY a job
  def current_user_has_high_permission_for_job(job = nil)
    return false if !logged_in?

    if job
      # user is manager of job
      current_user_is_admin or job.project_manager_id == current_user.id
    else
      # user is an admin or manager
      current_user.role <= 2
    end
  end

  # can READ a job
  # can CREATE / EDIT / DESTROY a jobs tasks
  def current_user_has_low_permission_for_job(job)
    return false if !logged_in?

    current_user_is_admin or job.superintendent_id == current_user.id or job.project_manager_id == current_user.id
  end
  
  # we can edit a user if
  # we are the user
  # OR we are an admin and they are not an admin (*Admins should not edit other admins unless its their own account)
  def we_can_edit_user?(user)
    return false if !logged_in?

    we_are_same_user = same_user?(user.id)
    we_have_admin_permission_to_edit = current_user_is_admin && user.role != 1 # admins cannot edit other admins

    we_are_same_user or we_have_admin_permission_to_edit 
  end
  def readable_role(number)
    number = number.to_i
    case number
    when 1
      return 'Admin'
    when 2
      return 'Manager'
    when 3
      return 'Superintendent'
    end
  end

  def we_have_permission_for_job?(job)
    return false if !logged_in? || !job

    we_are_superintendent = job.user_id == current_user.id

    we_are_superintendent or current_user_is_admin
  end
end
