require "rails_helper"

RSpec.describe WidgetsController, type: :controller do
  let!(:widget) { build(:widget) }

  describe "POST #save" do
    let(:request_params) do
      {
        widget: {
          name: widget.name,
          description: widget.description,
          kind: widget.kind
        }
      }
    end

    it "retrives all widgets" do
      get :index
      expect(response.status).to eq(200)
    end

    it "retrives my widgets" do
      get :my_widgets
      expect(response.status).to eq(200)
    end

    it "creates widget and redirects to widgets path" do
      post :create, params: request_params
      expect(response.status).to eq(302)
    end
  end
end
