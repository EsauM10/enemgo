require 'rails_helper'

RSpec.describe "SimulationAnswers", type: :request do
  describe "GET /simulation_answers" do
    it "works! (now write some real specs)" do
      get simulation_answers_path
      expect(response).to have_http_status(200)
    end
  end
end
