class User < ActiveRecord::Base
  has_many :user_auths
  has_many :auths, through: :user_auths

  def self.create_with_omniauth_facebook(auth_params)
    user = User.new
    if auth_params['info']
      user.name = auth_params['info']['name'] || ""
      user.email = auth_params['info']['email'] || ""
    end
    user.save
    user.auths.create(
      provider: auth_params['provider'],
      uid: auth_params['uid'],
      token: auth_params['credentials']['token'])
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

  def tweet(msg)
    if twitter_auth
      tweeter = Twitter::Client.new(
        oauth_token: twitter_auth.token,
        oauth_token_secret: twitter_auth.secret
        )
      tweeter.update(msg)
    end
  end

  def post_to_facebook(msg)
    if facebook_auth
      fb = Koala::Facebook::API.new(facebook_auth.token)
      fb.put_wall_post(msg)
    end
  end

  private

  def twitter_auth
    auths.where(provider: 'twitter').first
  end

  def facebook_auth
    auths.where(provider: 'facebook').first
  end

end
