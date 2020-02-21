class ApplicationController < ActionController::Base

  def current_user
    User.current_user
  end

  helper_method :current_user
end
