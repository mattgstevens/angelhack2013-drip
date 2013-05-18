class Auth < ActiveRecord::Base
  has_one :user_auth
  has_one :user, through: :user_auth
end
