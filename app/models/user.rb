class User < ActiveRecord::Base
  has_many :user_auths
  has_many :auths, through: :user_auths

  def tweet(msg)
    tweeter = Twitter::Client.new(
      oauth_token:, current_user.auth.token
      oauth_token_secret: current_user.auth.secret
    )
    tweeter.update(msg)
  end

  def self.create_with_omniauth_facebook(auth_params)
    user = User.new
    if auth_params['info']
      user.name = auth_params['info']['name'] || ""
      user.email = auth_params['info']['email'] || ""
    end
    user.save
    user.auths.create(provider: auth_params['provider'], uid: auth_params['uid'])
  end

  def self.create_with_omniauth_twitter(auth_params)
    user = User.new
    if auth_params['info']
      user.name = auth_params['info']['name'] || ""
    end
    user.save
    user.auths.create(
      provider: auth_params['provider'],
      uid: auth_params['uid'],
      token: auth_params['credentials']['token'],
      secret: auth_params['credentials']['secret']
    )
  end

end
