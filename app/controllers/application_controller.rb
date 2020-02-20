class ApplicationController < ActionController::Base
  before_action :check_user

  def check_user
    return if controller_name == 'users' && action_name == 'create'

    if current_user.nil?
      render new_user_path
    end
  end

  def current_user
    User.current_user
  end

  helper_method :current_user
end
