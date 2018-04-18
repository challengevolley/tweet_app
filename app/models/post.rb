class Post < ApplicationRecord
  # contentカラムに対して、空の投稿を制限するバリデーション
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
  
  # インスタンスメソッドuserを定義
  def user
    return User.find_by(id: self.user_id)
  end
end
