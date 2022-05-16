require 'rails_helper'
RSpec.describe Student, :type => :model do
  #before(:all) 会所有测试用例执行前，只执行一次
  before(:all) do
    student_1 = { name: '学生1', age: 19, teacher_id: 1 }
    student_2 = { name: '学生2', age: 10, teacher_id: 2 }
    @student1 = Student.create!(student_1)
    @student_2 = Student.create!(student_2)

  end

=begin
  let` is not available from within an example (e.g. an `it` block) or from constructs that run in the scope of an example (e.g. `before`, `let`, etc).
  It is only available on an example group (e.g. a `describe` or `context` block)
=end
  #使用let,需要注意let 只能写在 describe ,context 中
  let (:student_3) { Student.create!(name: '学生3', age: 20, teacher_id: 1) }
  let (:student_4) { Student.create!(name: '学生4', age: 10, teacher_id: 2) }

  let (:student_a) { build(:student_a) }
  let (:student_b) { build(:student_b) }

  #实例方法名称
  describe "#teacher_id_check?" do
    #黄老师的ID为 1
    context 'is a student of mr huang' do
      it 'student1 yes' do
        # 此处的 true 是 expect 预期的值,简单的 说 ,就是 执行 teacher_id_check? 方法 会得到的 结果
        expect(@student1.teacher_id_check?).to eq(true)
      end
      it 'student_3 yes' do
        expect(student_3.teacher_id_check?).to eq(true)
      end
      it 'student_a yes' do
        expect(student_a.teacher_id_check?).to eq(true)
      end
    end

    context 'not a student of mr huang' do
      it 'student_2 no' do
        expect(@student_2.teacher_id_check?).to eq(false)
      end
      it 'student_b no' do
        expect(student_b.teacher_id_check?).to eq(false)
      end
    end
  end

  #年龄是否大于 18 测试
  describe "#age_more_than_eighteen?" do
    # 年龄大于18
    context "students older than eighteen" do
      it "should respond with true" do
        student = Student.create!(name: '叶修', age: 18, teacher_id: 1)
        expect(student.age_more_than_eighteen?).to eq(true)
      end
    end
    # 如果模拟 测试不通过 , 提示 失败 如下所示 ,本来 预期 结果 是 true,但是 得到 了 false ,测试 没有通过
=begin
    Failures:
  1) Student#age_more_than_eighteen? students older than eighteen should respond with true
     Failure/Error: expect(student.age_more_than_eighteen?).to eq(true)

       expected: true
            got: false

       (compared using ==)

       Diff:
       @@ -1 +1 @@
       -true
       +false

     # ./spec/models/user_spec.rb:7:in `block (4 levels) in <top (required)>'

Finished in 0.09145 seconds (files took 2.45 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/models/user_spec.rb:5 # Student#age_more_than_eighteen? students older than eighteen should respond with true

=end

    #年龄 不大于18
    context "students younger than eighteen " do
      it "姜立 no" do
        student = Student.create!(name: '姜立', age: 17, teacher_id: 1)
        expect(student.age_more_than_eighteen?).to eq(false)
      end
      it 'student_4 no' do
        expect(student_4.age_more_than_eighteen?).to eq(false)
      end
      it 'student_b no' do
        expect(student_b.age_more_than_eighteen?).to eq(false)
      end
    end
  end
end
