class User < ApplicationRecord
  has_secure_password

  # 写法 1
  # scope :searchName, lambda { |user| where('name like ? ', "%#{user[:name]}") unless user[:name].blank? }
  # 写法 2
  scope :searchName, ->(user) { where('name like ? ', "%#{user[:name]}") unless user[:name].blank? }

  #将 用户ID 加入到 token 信息中
  def token
    {
      token: Token.encode(user_id: self.id, user_password: self.password_digest)
    }
  end
end
