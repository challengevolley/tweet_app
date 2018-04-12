class Post < ApplicationRecord
  # contentカラムに対して、空の投稿を制限するバリデーション
  validates :content, {presence: true, length: {maximum: 140}}
  
end
