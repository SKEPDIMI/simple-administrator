class SessionsController < ApplicationController
  def new
    @errors = nil
  end
  def create
    email = params[:session][:email]
    password = params[:session][:password]
    user = User.find_by(email: email.downcase)

    respond_to do |format|
      if user && user.authenticate(password)
        session[:user_id] = user.id

        format.html { redirect_to user, notice: 'Login was successful.' }
        format.json { render :show, status: :created, location: @user }
      else
        @errors = user ? ['Could not authenticate user'] : ['No user by this email found.']
        format.html { render :new }
        format.json { render :new, status: :unauthorized }
      end
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to users_url
  end
end
