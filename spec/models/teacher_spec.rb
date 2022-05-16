require 'rails_helper'
RSpec.describe Teacher, :type => :model do

  describe '#show_name' do

    #使用factory_bot构建数据
    context 'teacher string exists in name' do

      let (:teacher_liu) { create(:teacher_liu) }
      let (:teacher_zhao) { Teacher.create!(name: '赵无极', age: 88, description: '语文') }
      it 'teacher_liu yes' do
        #需要留意,调用方法, 赋值或者 计算 需要写在 it block 代码块/before/let 之中 ,在其他地方写,会报错
        teacher_liu_name = teacher_liu.show_name
        expect(teacher_liu_name[-2..-1] == '老师').to eq(true)
      end

      it 'teacher_zhao yes' do
        expect(teacher_zhao.show_name[-2..-1] == '老师').to eq(true)
      end
    end

    context 'teacher string exists not in name' do
      let (:teacher_wang) { create(:teacher_wang) }

      it 'teacher_wang no' do
        expect(teacher_wang.name[-2..-1] == '老师').to eq(false)
      end
    end
  end
end