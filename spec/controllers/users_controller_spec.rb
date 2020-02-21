require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let!(:user) { build(:user) }

  describe "POST #save" do
    let(:request_params) do
      {
        user: {
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email,
          password: user.password,
          image_url: user.image_url
        }
      }
    end

    it "creates user and redirects to users path" do
      post :create, params: request_params
      expect(response.status).to eq(302)
    end
  end
end
