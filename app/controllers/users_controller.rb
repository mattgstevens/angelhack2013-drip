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
    redirect_to user_info_path
  end

  def donate
    if current_user.can_donate?
      fakey = Clinic.new(x_coord: params[:latitude], y_coord: params[:longitude])
      nearest_clinic = fakey.nearbys(0.3, order: 'distance').first
      Donation.create(user: current_user, clinic: nearest_clinic, date: Date.today) if nearest_clinic.currently_open?
      redirect_to user_info_path,  :notice => "Thanks for donating"
    else
      redirect_to user_info_path,  :notice => "You cant donate now"
    end
  end

end
