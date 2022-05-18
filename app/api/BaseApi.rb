class BaseApi < Grape::API
  helpers CommonapiHelper
  # 当前用户信息
  attr_reader :current_user
  rescue_from RuntimeError do |e|
    abnormal_data = JSON.parse(e.to_s)
    return_exception = return_data '', abnormal_data["code"], abnormal_data["msg"]
    rack_response(format_message(return_exception, e.backtrace), 500)
  end

  # 前置 方法,校验所有 继承的 api 接口(排除 login 登录 接口),是否 存在 token
  before do
    # 排除 接口 白名单,不需要校验
    white_list_config = Config.load_files(Rails.root.to_s + '/config/custom/user.yml').token_white_list
    curr_uri = (request.env['REQUEST_PATH'])
    unless white_list_config[curr_uri]
      http_token ||= if request.headers['Authorization'].present?
                       request.headers['Authorization'].split(' ').last
                     end

      unless http_token
        raise_json = { msg: 'sorry,no tokan value', code: 201 }.to_json
        raise raise_json
      end

      auth_token ||= Token.decode(http_token)

      unless auth_token || auth_token[:user_id].blank?
        raise_json = { msg: 'sorry,token error', code: 202 }.to_json
        raise raise_json
      end

      @current_user = User.find_by(id: auth_token[:user_id])

      unless @current_user
        raise_json = { msg: 'sorry,user does not exist or error', code: 203 }.to_json
        raise raise_json
      end
    end
  end
end