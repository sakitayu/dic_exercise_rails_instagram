class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  mount_uploader :image, ImageUploader
  has_many :blogs
  has_many :favorites, dependent: :destroy
  #has_many :favposts, through: :favorites, source: :blog

  # ↓そもそもいらないので削除して！！！
  # #お気に入り追加
  # def like(blog)
  #   favorites.find_or_create_by(blog_id: blog.id)
  # end

  # #お気に入り削除
  # def unlike(blog)
  #   favorite = favorites.find_by(blog_id: blog.id)
  #   favorite.destroy if favorite
  # end

  # # #お気にり登録判定
  # # def  favpost?(blog)
  # #   self.favposts.include?(blog)
  # # end
end
