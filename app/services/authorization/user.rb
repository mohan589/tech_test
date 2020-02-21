module Authorization
  extend ActiveSupport::Concern

  def set_user(current_user)
    @current_user ||= current_user
  end

  def get_user
    @current_user
  end
end
