class CourseTestApi < BaseApi
    # #version是 grape 的 一个方法,路由 添加 v1 作为  版本区分
    # version 'v1', using: :path, vendor: 'v1'
    # version 'v1', using: :path

    format 'json'

    #挂载 teacherTest 相关api
    mount TeacherTestApi

    #挂载 员工 相关api
    mount EmployeeTestApi

    #挂载教师相关 api
    mount TeacherApi

    #引入 module 里面的 helper 方法
    helpers StudentHelper
    #helper 方法的声明 必须要在调用的 代码块之前,否则 无法找到,会报错

    helpers do
      #定义helper方法
      def client_ip
        env['action_dispatch.remote_ip'].to_s
      end

      # 定义 helper 参数
      params :user_id do
        requires :user_id, type: Integer
      end

      params :pagination do
        optional :page, type: Integer
        optional :per_page, type: Integer
      end

    end
    #before回调在 api调用之前
    before do
      # Rails.logger.debug "===> params is: #{params.inspect}\n===> headers is: #{headers.inspect}"
      Rails.logger.info("===> params is: #{params.inspect}====>start running " + Time.now.to_s)
      @start_time = Time.now #开始时间
    end

    #after回调在api调用之后
    after do
      Rails.logger.info("end running " + Time.now.to_s)
      take_time = Time.now - @start_time #api接口调用时间
      Rails.logger.info("take_time " + take_time.to_s)
    end

    #此处访问的 就是 http://127.0.0.1:3000/coursetest/hello
    get 'hello' do
      return_data name: 'hello world'
    end

    #路由-命名空间
    namespace :students do
      desc '获取用户信息'
      params do
        # 使用 helper 中定义的参数,user_id必传,否则 提示 "error": "user_id is missing"
        use :user_id
      end
      # 请求url  http://127.0.0.1:3000/coursetest/students/info?user_id=1
      get 'info' do
        # helper方法 client_ip 必须要先于  调用 声明, 否则报错  undefined local variable or method `client_ip' for
        data = {
          name: 'hello students/info',
          return_ip: client_ip,
          re_full_name: full_name
        }
        dump(data)
        return_data data
      end

      desc '创建用户'
      # post 请求  http://127.0.0.1:3000/coursetest/students/create_user
      post 'create_user' do
        return_data name: "create students/create_user"
      end

    end
  end
