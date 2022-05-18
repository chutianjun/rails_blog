module Web
  module V1
    #users 接口 api相关
    module Users
      class StudentApi < WebApiBase
        desc 'Return grade_schools 20 records'
        # url 127.0.0.1:3000/web/v1/index
        get :index do
          # dd(Student.first)
          return_data Student.limit(20)
        end
        resource :grade_schools do
          desc '获取学生'
          get :index do
            return_data Student.limit(20)
          end
        end
      end
    end
  end
end
