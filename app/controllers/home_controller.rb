class HomeController < ActionController::Base
  def index
    @user = User.find_by_id(session[:user_id])
  end
end
