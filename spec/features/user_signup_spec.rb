require 'rails_helper'

RSpec.describe "User Signup Page", type: :feature do
  let!(:dakota) { User.new(name: "dakota", password: "dakota") }
  
  it "redirects to the user profile page after successful Sign Up" do
    visit signup_path 
    fill_in "user_name", with: dakota.name
    fill_in "user_password", with: dakota.password
    fill_in "user_password_confirmation", with: dakota.password
    click_button "Sign Up"
    dakota = User.last
    expect(page.current_path).to eq(user_path(dakota))
  end
  
  it "reloads the signup page if password and confirmation do not match" do 
    visit signup_path
    fill_in "user_name", with: dakota.name 
    fill_in "user_password", with: dakota.password
    fill_in "user_password_confirmation", with: dakota.password + "x"
    click_button "Sign Up" 
    expect(page.current_path).to eq(new_user_path)
  end
end
