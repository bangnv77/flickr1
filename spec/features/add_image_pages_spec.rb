require 'rails_helper'

describe "the add an image process" do
  it "allows a user to upload an image" do
    user = FactoryGirl.create(:user)
    visit images_path
    click_link 'Login'
    fill_in 'Email', :with => 'a@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'Add an Image'
    fill_in 'image_title', :with => 'Boat'

    page.attach_file('image_image', 'spec/fixtures/images/img1.jpg')
    click_button 'Create Image'
    expect(page).to have_content 'Woohoo! You successfully uploaded an image!'
  end

  it "won't save an image without a title" do
    user = FactoryGirl.create(:user)
    visit images_path
    click_link 'Login'
    fill_in 'Email', :with => 'a@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'Add an Image'
    fill_in 'image_title', :with => ''
    page.attach_file('image_image', 'spec/fixtures/images/img1.jpg')
    click_button 'Create Image'
    expect(page).to have_content "Title can't be blank"
  end
end
