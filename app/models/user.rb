class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  attachment :profile_image, destroy: false

  validates :name, length: { minimum: 2,maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  def followed_by?(current_user)
    # これはcurrent_userが相手をフォローしているのかが知りたい
    # relationship テーブルのカラムを参照する
    #Relationship.where(follower_id: current_user.id)

    return false # フォローしている場合はtrue していないならfalse
  end
end
