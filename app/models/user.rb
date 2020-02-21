class User
  def self.create_user(params)
    @user ||= Resources::UserFactory.post(payload: { :user => params })
  end

  def self.current_user
    @user
  end

  def self.current_token
    self.current_user&.dig("token")
  end

  def self.revoke_user
    @user = Resources::UserFactory.revoke_user
    current_user = nil
  end

  attr_accessor :first_name, :last_name, :email, :password, :image_url, :access_token, :payload, :token_type, :refresh_token, :email
end
