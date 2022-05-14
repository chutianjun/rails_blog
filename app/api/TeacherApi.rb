class TeacherApi < BaseApi
  format 'json'
  #  第一题,1.定义TeacherHelper文件,定义full_name方法,返回对应数据
  #
  # 使用 helpers 的两种方式
  # 1.引入studentHelper module
  # 2.直接在api中定义hepers也可以
  helpers TeacherHelper

  helpers do
    #定义helper方法
    def client_ip
      env['action_dispatch.remote_ip'].to_s
    end

    # 定义 helper 参数
    params :teacher_id do
      requires :teacher_id, type: Integer, desc: '老师ID'
    end
    params :age do
      requires :age, type: Integer, desc: '老师年龄'
    end
  end

  #第一题2.在before和 after里记录 接口的访问时间,日志中查看
  before do
    #记录日志
    Rails.logger.info("start running " + Time.now.to_s)
    @start_time = Time.now #开始时间
  end

  #after回调,在api调用之后
  after do
    Rails.logger.info("end running " + Time.now.to_s)
    take_time = Time.now - @start_time #api接口调用时间
    Rails.logger.info("take_time " + take_time.to_s)
  end

  #第一题, 3.完成参数的类型限制,并对 异常进行 处理
  #捕获 grape 参数的 异常,并返回 错误 通知
  rescue_from Grape::Exceptions::ValidationErrors do |e|
    error_mapping = {
      teacher_id: '老师ID',
      age: '老师年龄'
    }
    error_params = []
    e.as_json.each do |value|
      error_params << error_mapping[value[:params].join('').to_sym]
    end
    err_msg = '[' + error_params.join('],[') + '] 填写错误,请仔细检查'
    message = return_data '', 400, err_msg
    rack_response(format_message(message, e.backtrace), 500)
  end
  #
  #
  # backtrace 是否 打印 track 代码堆栈
  # rescue_from :all, backtrace: false do |e|
  #   message = { errors: { all: e.message } }
  #   rack_response(format_message(message, e.backtrace), 500)
  # end
  #

  desc '通过ID获取老师的信息'
  params do
    #定义需传参数
    use :teacher_id
    use :age
  end
  #访问 url  http://127.0.0.1:3000/teachers/info?teacher_id=1&age=20
  get 'info' do
    return_data return_ip: client_ip, teacher_info: full_name(params[:teacher_id])
  end

  desc '测试'
  get 'test' do
  end
end
