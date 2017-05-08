class Image < ApplicationRecord
  belongs_to :user
  attr_accessor :file
  has_attached_file :file, styles: { thumbnail: "100x100>" }, default_url: "/no_img.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
