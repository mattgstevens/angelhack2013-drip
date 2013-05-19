class UsersController < ApplicationController

  def info
    unless current_user
      redirect_to(:controller => 'home', :action => 'index') and return
    end
  end

  def update
    if current_user
      current_user.update_attributes(params[:user])
    end
    redirect_to info_path
  end

end
