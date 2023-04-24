require "rails_helper"

describe "Sessions API" do
  it "can get a new session" do
    user = User.create!(email: "sally@email", password: "password1", password_confirmation: "password1")
    
    user_params= {
        email: "sally@email",
        password: "password1",
        password_confirmation: "password1"
    }.to_json

    post "/api/v0/sessions", params: user_params, headers: { 'Content-Type': 'application/json' }

    parsed = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it "can't get a new session with bad password" do
    user_params= {
      email: "sally@email",
      password: "password1",
      password_confirmation: "password1"
    }.to_json

    post "/api/v0/sessions", params: user_params, headers: { 'Content-Type': 'application/json' }

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end    