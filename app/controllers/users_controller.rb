class UsersController < ApplicationController
  def create
    @user = User.create_user(user_params)

    if @user.present?
      redirect_to widgets_path
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def revoke_user
    @user = User.revoke_user
    redirect_to root_path
  end

  def reset_password
    @user = User.reset(user_params)
  end

  private
  def user_params
    params.required(:user).permit(:first_name, :last_name, :email, :password, :image_url)
  end
end
