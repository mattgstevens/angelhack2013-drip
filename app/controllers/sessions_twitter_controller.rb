class SessionsTwitterController < ApplicationController

  def new
    redirect_to '/auth/twitter'
  end

  def create
    auth = request.env["omniauth.auth"]
    user_auth = UserAuth.where(provider: auth['provider'], uid: auth['uid']).first
    if user_auth
      user = user_auth.user
    else
      user = User.create_with_omniauth_twitter(auth)
    end
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end
end
