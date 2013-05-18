class UserAuth < ActiveRecord::Base
  belongs_to :user
  belongs_to :auth
end
