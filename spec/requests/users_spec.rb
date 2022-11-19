require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "GET /index" do
    it "returns http success" do
      user = User.create(name:"Wilma", email:"W@wilma.com", password:"1234")

      get "/users"

      expect(response).to have_http_status(:ok)
    end
  end
  describe "POST create" do
    context " Criar usuário" do
      it "deve retornar status 201" do
        user_params = { user: {
            name:"Lyla",
            email: "l@lyla.com",
            password: "123"
          }
        }
        
        post "/users", params: user_params
        
        expect(response).to have_http_status(201)
        expect(JSON.parse(response.body)).to include("email")
      end
    end
    context "Quando o usuário não puder ser criado" do
      it "Deve retornar status 422 " do
        user_params = { user: {
            name:"Lyla",
            email: nil,
            password: "123"
          }
        }
        
        post "/users", params: user_params
        
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to include("Email can't be blank")
      end
    end
  end
end
