require 'rails_helper'

describe "the edit an image process" do
  before(:each) do
    image = FactoryGirl.create(:image)
    visit images_path
    click_link 'Login'
    fill_in 'Email', :with => 'a@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
  end

  it "allows a user to edit an image" do
    click_on 'Boat'
    click_link 'Edit image'
    fill_in 'Title', :with => 'Ship'
    click_on 'Update Image'
    expect(page).to have_content 'Your image has been edited!'
  end

  it "allows a user to delete an image" do
    click_on 'Boat'
    click_link 'Delete image'
    expect(page).to have_content 'Your image has been deleted!'
  end

  it "won't edit an image if there's no title" do
    click_on 'Boat'
    click_link 'Edit image'
    fill_in 'Title', :with => ''
    click_on 'Update Image'
    expect(page).to have_content 'Whoops, your image was not edited!'
  end
end
