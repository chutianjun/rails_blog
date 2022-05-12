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

#老师关联关系表
# teacher_id 老师ID ,super_id,他的上级ID
teacher_relation = [
  { teacher_id: 2, super_id: 1 },
  { teacher_id: 3, super_id: 1 },
  { teacher_id: 4, super_id: 1 },
  { teacher_id: 5, super_id: 1 },
  { teacher_id: 6, super_id: 1 },
]
teacher_relation.each do |item|
  TeacherStructure.create(teacher_id:"#{item[:teacher_id]}",super_id:"#{item[:super_id]}")
end


#课程相关数据
course_info = %w[语文 数学 物理 化学]
course_info.each { |item| Course.create(course_name: "#{item}") }

#学生相关数据
student_info = %w[白小纯 韩立 紫川秀]
student_info.each do |item|
  Student.create(name: "#{item}", teacher_id: 1, age: 18)
end

#学生课程分数相关数据
student_info.each_with_index do |student_item, student_index|
  course_info.each_with_index do |course_item, course_index|
    Score.create(score: Random.rand(100), student_id: student_index + 1, course_id: course_index + 1)
  end
end

Employee.create(name: '王老板') #1
Employee.create(name: '营销主管', parent_id: 1) #2
Employee.create(name: '营销组长', parent_id: 2) #3
Employee.create(name: '技术主管', parent_id: 1) #4
10.times do |item|
  Employee.create(name: "营销员工#{item}", parent_id: 3)
end
10.times do |item|
  Employee.create(name: "技术员工#{item}", parent_id: 4)
end










