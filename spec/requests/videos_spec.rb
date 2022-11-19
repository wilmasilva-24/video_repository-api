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
  describe "GET /show" do
    it "Deve retornar vídeo selecionado" do
      user = User.create(name:"Wilma", email:"W@wilma.com", password:"1234")
      video = Video.create(name:"Peppa", description:"Video 1", url:"https://www.youtube.com/watch?v=boJxbemJ7j4",user_id: user.id)

      get "/videos/#{video.id}"

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include("description")
    end
  end
  describe "POST create" do
    context " Adicionando vídeo" do
      it "deve retornar status 201" do
        user = User.create(name:"Wilma", email:"W@wilma.com", password:"1234")
        video_params = { video: {
            name:"Música nova",
            description: "Joãozinho, Temos de Ter Cuidado no Shopping",
            url: "https://www.youtube.com/watch?v=JkZoo0d6oLU&t=6s",
            user_id: user.id
          }
        }
        
        post "/videos", params: video_params
        
        expect(response).to have_http_status(201)
        expect(JSON.parse(response.body)).to include("url")
      end
    end
    context "Quando o vídeo não puder ser adicionado" do
      it "Deve retornar status 422" do
        user = User.create(name:"Lila", email:"l@l.com", password:"12345")
        error_params = { video: {
          name:"Animais",
          description:"Animais na floresta",
          url: nil,
          user_id: user.id
          }
        }

        post "/videos", params: error_params

        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to include("Url can't be blank")
      end
    end
  end
end
