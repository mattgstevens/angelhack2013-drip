class User < ActiveRecord::Base
  has_many :user_auths
  has_many :auths, through: :user_auths

  def self.create_with_omniauth_facebook(auth)
    user = User.new
    if auth['info']
      user.name = auth['info']['name'] || ""
      user.email = auth['info']['email'] || ""
    end
    user.save
    user.user_auths.create(provider: auth['provider'], uid: auth['uid'])
  end

  def self.create_with_omniauth_twitter(auth)
    user = User.create
    user.user_auths.create(provider: auth['provider'], uid: auth['uid'])
  end

end
