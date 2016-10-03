require 'rails_helper'

describe "the user login process" do
  before(:each) do
    user = FactoryGirl.create(:user)
    visit images_path
  end

  it "logs in a user" do
    click_link 'Login'
    fill_in 'Email', :with => 'a@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content 'Logged in as a@gmail.com'
  end

  it "allows a user to see their profile page" do
    click_link 'Login'
    fill_in 'Email', :with => 'a@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'My Profile'
    expect(page).to have_content "a@gmail.com's profile"
  end
end
