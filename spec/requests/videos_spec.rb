require 'rails_helper'

RSpec.describe VideosController, type: :request do
  describe "GET /index" do
    it "returns http success" do
      user = User.create(name:"Wilma", email:"W@wilma.com", password:"1234")
      video = Video.create(name:"Peppa", description:"Video 1", url:"https://www.youtube.com/watch?v=boJxbemJ7j4",user_id: user.id)

      get "/videos"

      expect(response).to have_http_status(:ok)
    end
  end
end
