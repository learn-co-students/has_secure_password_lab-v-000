require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
  it "displays login link if user not logged in" do 
    if session[:name] = nil 
     expect(page).to have_content 'login'
    end
  end
end
