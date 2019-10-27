class Blog < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, unless: :image? #画像がある場合はcontentが空でもvalidatesが有効になる設定
  mount_uploader :image, ImageUploader
  has_many :favorites, foreign_key: 'blog_id', dependent: :destroy
  has_many :users, through: :favorites
end
