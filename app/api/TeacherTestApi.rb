class TeacherTestApi < BaseApi
  namespace :teachers do
    # url 如下  http://127.0.0.1:3000/coursetest/teachers/info?teacher_id=1
    format 'json'
    desc '获取老师信息'
    #接收参数,必传
    params do
      requires :teacher_id, type: Integer
    end
    get 'info' do
      teacher = Teacher.find_by_id(params[:teacher_id])
      teacher = '' if teacher.blank?
      return_data teacher_info:teacher
    end
  end

end
