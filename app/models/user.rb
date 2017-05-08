class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friends
  has_many :geo_histories
  has_many :images

  has_and_belongs_to_many :dialogs

  has_attached_file :avatar, styles: {large: "300x300>", medium: "200x200>", thumb: "100x100>" }, default_url: "/no_img.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
