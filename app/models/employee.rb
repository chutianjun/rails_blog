class Employee < ApplicationRecord
  #自关联
  belongs_to :parent, class_name: 'Employee', foreign_key: 'parent_id',optional: true
  has_many :children, class_name: 'Employee', foreign_key: 'parent_id'
  has_many :grand_chidren, :through => :children, :source => :children


end
