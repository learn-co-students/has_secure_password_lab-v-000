require 'rails_helper'

RSpec.describe "User Login Page", type: :feature do
  let!(:dakota) { User.create(name: "dakota", password: "dakota", password_confirmation: "dakota") }
  
  it "redirects to the user profile page after successful login" do
    visit login_path 
    fill_in "user_name", with: dakota.name
    fill_in "user_password", with: dakota.password 
    click_button "Log In"
    expect(page.current_path).to eq(user_path(dakota))
  end
  
  it "reloads the login page upon incorrect login credentials" do 
    visit login_path 
    fill_in "user_name", with: dakota.name 
    fill_in "user_password", with: dakota.password + "x" 
    click_button "Log In" 
    expect(page.current_path).to eq(login_path)
  end
end
