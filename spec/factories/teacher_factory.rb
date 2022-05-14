FactoryBot.define do
  #王佳斌老师
  factory :teacher_wang, class: 'Teacher' do
    name { '王佳斌' }
    age { 45 }
    description { 'php/java' }
  end


  #刘德福老师
  factory :teacher_liu, class: 'Teacher' do
    name { '刘德福老师' }
    age { 88 }
    description { 'golang/c#/.net' }
  end
end

