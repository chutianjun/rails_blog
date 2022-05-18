class UserApi < BaseApi
  format 'json'
  #引入用户的相关 helper方法
  helpers ::Helpers::UserHelper

  #捕获 grape 参数的 异常,并返回 错误 通知
  rescue_from Grape::Exceptions::ValidationErrors do |e|
    message = return_data '', 400, e.message
    #这里 http状态码 还是报 200, 接口可以通过, 只是字段 规则 错误,如果是状态码 500, 浏览器会 判断是 服务器 错误,
    rack_response(format_message(message, e.backtrace), 200)
  end

  desc '添加用户'
  params do
    #requires 必填,allow_blank  false 不能为空
    requires :username, type: String, desc: '用户名', allow_blank: false
    # requires :number, type: Integer, values: {
    #   #范围1到20
    #   value: 1..20,
    #   #违法的数值
    #   except: [4, 13],
    #   except_message: '数字包含了不合法的名称',
    #   message: '数字超过范围'
    # }
    #定义需传参数
  end
  post 'add' do
    # 读取 自定义 配置 文件
    # c=Config.load_files(Rails.root.to_s+'/config/custom/user.yml')
    # dd(c)
    #
    # 读取config下配置文件
    # config= Rails.application.config_for(:database).username
    # dd(config)
    #
    begin
      return_data save_user(params)
    rescue Exception => e
      Rails.logger.info(e)
      return_data '', 201, '新建用户失败,请重试'
    ensure
    end
  end

  desc '用户列表'
  params do
  end
  post 'list' do
    return_data user_list(params)
  end

  desc '修改用户'
  params do
    #requires 必填,allow_blank  false 不能为空
    requires :id, type: Integer, desc: '用户ID', allow_blank: false
  end
  post 'edit' do
    return_data edit_user(params)
  end

  desc '删除用户'
  params do
    requires :id, type: Integer, desc: '用户ID', allow_blank: false
  end
  post 'del' do
    return_data del_user(params)
  end

  desc 'redis 测试'
  get 'redis' do
    $redis.set("home", "中国")
    return_data $redis.get('a')
  end

  desc '用户登录,并且获取token值'
  params do
    requires :username, type: String, desc: '用户名', allow_blank: false
    requires :password, type: String, desc: '密码', allow_blank: false
  end
  post 'login' do
    if (user = User.find_by(username: params[:username]).try(:authenticate, params[:password]))
      return_data user.token
    else
      return_data '', 201, '用户名或密码错误'
    end
  end

end

