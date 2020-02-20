class UsersController < ApplicationController
  def create
    @user = User.create_user(user_params)

    if @user.present?
      redirected_to widgets_path
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  private
  def user_params
    params.required(:user).permit(:first_name, :last_name, :email, :password, :image_url)
  end
end
