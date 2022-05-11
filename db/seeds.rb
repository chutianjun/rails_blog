# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 初始化数据库
teacher_info=[
  {name:'huang',age:20,'description':'ruby/js'},
  {name:'chen',age:20,'description':'ruby/js/vue'},
  {name:'yuan',age:25,'description':'ruby/go'},
  {name:'zeng',age:26,'description':'ruby/js'},
  {name:'lu',age:27,'description':'ruby/go'},
  {name:'ma',age:24,'description':'java'}
]
teacher_info.each do |item|
  Teacher.create(name:"#{item[:name]}",age:"#{item[:age]}",description:"#{item[:description]}")
end
