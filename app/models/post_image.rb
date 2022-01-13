class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # userに属するpost
  has_many :post_comments, dependent: :destroy
  
  
  def get_image
  # ここで記述するメソッドはアクションとは違い、特定の処理を名前で呼び出すことができる
    unless image.attached?
    # 画像がなければ
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
