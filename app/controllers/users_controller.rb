class UsersController < ApplicationController

  def update
    if current_user
      current_user.update_attributes(params[:user])
    end
    redirect_to root_url
  end

end
