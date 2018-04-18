class User < ApplicationRecord
  # nameカラムに関するバリデーションを作成してください
  validates :name, {presence: true}
  # emailカラムに関するバリデーションを作成してください
  validates :email, {presence: true, uniqueness: true}
  # passwordカラムにバリデーションを設定
  validates :password, {presence: true}
  
  # インスタンスメソッドpostsを定義
  def posts
    return Post.where(user_id: self.id)  
  end

end
