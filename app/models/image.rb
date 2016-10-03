class Image < ApplicationRecord
  validates :title, :email, :presence => true
end
