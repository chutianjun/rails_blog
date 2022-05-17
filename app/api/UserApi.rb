class UserApi < BaseApi
  format 'json'
  #引入用户的相关 helper方法
  helpers ::Helpers::UserHelper

  #捕获 grape 参数的 异常,并返回 错误 通知
  rescue_from Grape::Exceptions::ValidationErrors do |e|
    message = return_data '', 400, e.message
    rack_response(format_message(message, e.backtrace), 500)
  end

  desc '添加用户'
  params do
    #requires 必填
    requires :name, type: String, desc: '用户名'
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
    return_data save_user(params)
  end

  desc '用户列表'
  params do

  end
  post 'list' do
    return_data user_list(params)
  end


  desc 'redis 测试'
  get 'redis' do
    $redis.set("home","中国")
    return_data $redis.get('a')
  end

end

