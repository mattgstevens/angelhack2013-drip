class SessionsTwitterController < ApplicationController

  def new
    redirect_to '/auth/twitter'
  end

  def create
    auth_params = request.env["omniauth.auth"]
    auth = Auth.where(provider: auth_params['provider'], uid: auth_params['uid']).first
    if auth
      user = auth.user
    else
      user = User.create_with_omniauth_twitter(auth_params)
    end
    session[:user_id] = user.id
    session[:provider] = 'twitter'
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end
end
