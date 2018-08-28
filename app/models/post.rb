class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates_presence_of :title
end
