class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image

  def self.search(search)
    if search
      User.where(['name LIKE ? OR introduction LIKE ?', "%#{search}%", "%#{search}%"])
    else
      User.all
    end
  end
end
