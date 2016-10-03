FactoryGirl.define do
  factory(:image) do
    title("Boat")
    user
    image Rack::Test::UploadedFile.new('spec/fixtures/images/img1.jpg', 'image/jpg')
  end
end
