class User < ApplicationRecord
  # scope :searchName, lambda { |user| where('name like ? ', "%#{user[:name]}") unless user[:name].blank? }
  scope :searchName, ->(user) { where('name like ? ', "%#{user[:name]}") unless user[:name].blank? }
end
