require 'rails_helper'

RSpec.describe "Login", type: :feature do

#set up this account actually?
  let(:hallie) {User.create(username: 'hallie', name: 'Hallie', password: 'hatsandmops')}

  it "User types valid username and password" do
    visit '/sessions/new'
    fill_in 'user_username', with: hallie.username
    fill_in 'user_password', with: hallie.password
    click_button 'Login'

    # expect(response).to redirect_to('/hello')
    expect(page.body).to have_selector("h1")
    expect(page.body).to have_content("Hello Hallie")
  end

  it "User types invalid username and password" do
    visit '/sessions/new'
    fill_in 'user_username', with: 'hallie'
    fill_in 'user_password', with: 'moonman'
    click_button 'Login'

    # expect(response).to redirect_to('/login')
    expect(page.body).to have_selector("form")
    expect(page.body).to have_content("Your username and password do not match")
  end

end
