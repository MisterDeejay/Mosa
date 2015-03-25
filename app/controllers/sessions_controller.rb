class SessionsController < ApplicationController
  # before_action :
  def new
    require_signed_out!
  end

  def create
    @user = User.find_by_credentials(params[:user])
    if(@user)
      sign_in!(@user)
      redirect_to root_url
      # fail
    else
      flash.now[:errors] = ["Incorrect Username/Password combination!"]
      render :new
    end
  end

  def destroy
    sign_out!
    redirect_to root_url
  end
end
