class PostImage < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  # userに属するpost
end
