class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_many :comments

  # バリデーション
  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :year, :month, :day, :number, :gender, :password_confirmation,  presence: true

  # 文字の形式制限
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/,
    message: "全角文字のみが使えます" }
  validates :family_name_kana,:first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/,
    message: "全角カナのみが使えます" }

  # アソシエーション
  has_many :items, dependent: :destroy
  has_one :address
  has_one :card

  mount_uploader :user_image, ImageUploader
  mount_uploader :user_bg_image, ImageUploader
end

