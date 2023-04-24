require "rails_helper"

describe "User API" do
  it "can get a new user" do
    user = User.create!(email: "bob@email.com", password: "password", password_confirmation: "password")
    
    user_params= {
        email: user.email,
        password: user.password,
        password_confirmation: user.password_confirmation
      }.to_json

    post "/api/v0/users", params: user_params, headers: { 'Content-Type': 'application/json' }

    parsed = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
    #returning :error=>"Email has already been taken"
    expect(response).to be_successful
    expect(response.status).to eq(200)
  end  
end