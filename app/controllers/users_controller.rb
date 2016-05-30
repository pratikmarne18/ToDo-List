class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @users = User.where("is_admin=?",false)
  end
  
  def new
    @user= User.new
  end
  
  def create_user
    @user = User.new(user_params)
    if @user.save
      #flash[:success] = "Developer created successfully."
      redirect_to users_path
    else
      #flash[:danger] = "#{@user.errors.full_messages[0]}"
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
