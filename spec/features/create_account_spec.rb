require 'rails_helper'

RSpec.describe "Create Account", type: :feature do

  it "User types valid username, password and matching confirm password" do
    visit '/users/new'
    fill_in 'user_username', :with => "hallie"
    fill_in 'user_password', :with => "hatsandmops"
    fill_in 'user_password_confirmation', :with => "hatsandmops"
    click_button 'Create account'

    # expect(page).to render('hello')
    expect(page.body).to have_selector("h1")
    expect(page.body).to have_content("Hello")
  end

  it "User types valid username, password BUT confirm password does not match" do
    visit '/users/new'
    fill_in 'user_username', :with => "hallie"
    fill_in 'user_password', :with => "hatsandmops"
    fill_in 'user_password_confirmation', :with => "love"
    click_button 'Create account'

    # expect(page).to redirect_to('/login')
    expect(page.body).to have_selector("form")
    expect(page.body).to have_text("Password confirmation doesn't match Password
")
  end
end
