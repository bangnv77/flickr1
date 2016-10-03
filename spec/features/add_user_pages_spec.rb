require 'rails_helper'

describe "the add a user process" do
  it "creates a new user" do
    visit images_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'a@gmail.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it "won't create a new user without matching password" do
    visit images_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'a@gmail.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'pass'
    click_on 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end
end
