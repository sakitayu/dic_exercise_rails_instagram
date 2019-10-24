class Blog < ApplicationRecord
  belongs_to :user
  #画像がある場合はcontentが空でもvalidatesが有効になる設定
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
