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
    user.auths.create(provider: auth_params['provider'], uid: auth_params['uid'])
  end

  def self.create_with_omniauth_twitter(auth_params)
    user = User.create
    user.auths.create(provider: auth_params['provider'], uid: auth_params['uid'])
  end

end
