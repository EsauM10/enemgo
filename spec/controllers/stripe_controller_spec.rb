require 'rails_helper'

RSpec.describe StripeController, type: :controller do

  describe "GET #webhook" do
    it "returns http success" do
      get :webhook
      expect(response).to have_http_status(:success)
    end
  end

end
