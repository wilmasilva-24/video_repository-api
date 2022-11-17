require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "GET /index" do
    it "returns http success" do
      user = User.create(name:"Wilma", email:"W@wilma.com", password:"1234")

      get "/users"

      expect(response).to have_http_status(:ok)
    end
  end
end
