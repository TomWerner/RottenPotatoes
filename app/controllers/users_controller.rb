class UsersController < ApplicationController
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
  
  def new
  end
  
  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      redirect_to users_show_path(user)
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
end
