require "rails_helper"

describe "User API" do
  it "can get a new user" do
    user_params= {
        email: "bob@email.com", 
        password: "password",
        password_confirmation: "password"
    }.to_json

    post "/api/v0/users", params: user_params, headers: { 'Content-Type': 'application/json' }

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
  end  

  it "can't get a new user with bad password confirmation" do
    user_params= {
      email: "bob@email.com", 
      password: "password",
      password_confirmation: ""
    }.to_json

    post "/api/v0/users", params: user_params, headers: { 'Content-Type': 'application/json' }    

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end 
end