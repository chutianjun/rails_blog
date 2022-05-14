FactoryBot.define do
  # 年龄大于18岁,属于黄老师 teacher_id->1
  factory :student_a, class: 'Student' do
    id { 1 }
    name { '学生a' }
    age { 19 }
    teacher_id { 1 }
  end
  # 年龄小于18岁,不属于黄老师
  factory :student_b, class: 'Student' do
    id { 2 }
    name { '学生b' }
    age { 10 }
    teacher_id { 2 }
  end
end

