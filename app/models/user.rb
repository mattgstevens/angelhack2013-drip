class User < ActiveRecord::Base
  has_many :user_auths
  has_many :auths, through: :user_auths
end
