module Web
  module V1
    module Users
      class StudentApi < WebApiBase
        desc 'Return grade_schools 20 records'
        # url 127.0.0.1:3000/web/v1/index
        get :index do
          dump(Student.first)
          Student.limit(20)
        end
      end
    end
  end
end
