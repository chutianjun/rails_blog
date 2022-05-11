# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 初始化数据库
# 老师相关
teacher_info = [
  { name: 'huang', age: 20, 'description': 'ruby/js' },
  { name: 'chen', age: 20, 'description': 'ruby/js/vue' },
  { name: 'yuan', age: 25, 'description': 'ruby/go' },
  { name: 'zeng', age: 26, 'description': 'ruby/js' },
  { name: 'lu', age: 27, 'description': 'ruby/go' },
  { name: 'ma', age: 24, 'description': 'java' }
]
teacher_info.each do |item|
  Teacher.create(name: "#{item[:name]}", age: "#{item[:age]}", description: "#{item[:description]}")
end

#课程相关数据
course_info = %w[语文 数学 物理 化学]
course_info.each { |item| Course.create(course_name: "#{item}") }

#学生相关数据
student_info = %w[白小纯 韩立 紫川秀]
student_info.each do |item|
  Student.create(name: "#{item}")
end


#学生课程分数相关数据
student_info.each_with_index do |student_item, student_index|
  course_info.each_with_index do |course_item, course_index|
    Score.create(score: Random.rand(100), student_id: student_index + 1, course_id: course_index + 1)
  end
end




