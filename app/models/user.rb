class User
  def self.create_user(params)
    @user = Resources::UserFactory.post(payload: { :user => params })
  end

  def self.current_user
    @user
  end

  attr_accessor :first_name, :last_name, :email, :password, :image_url, :access_token, :payload, :token_type, :refresh_token, :email
end
