class SessionController < ApplicationController
  def new
  end

  # Checks if user exists and tries to authenticate
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      # User exists and password is correct => login
      login_user user
      redirect_to user
    else
      # A problem happened , print errors
      flash[:error] = "Authentication error"
      render 'new'
    end
  end

  # Destroys the session (logs the user out)
  def destroy
    log_out
    redirect_to '/'
  end
end
