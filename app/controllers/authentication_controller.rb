class AuthenticationController < ApplicationController
  #用户通过账号 密码 登录 ,并获取 token
  def create
    begin
      # ( User.find_by(username: params[:username]).respond_to?("authenticate")) #true
      if (user = User.find_by(username: params[:username]).try(:authenticate, params[:password]))
        return_data user.token
      else
        return_data '', 200, '用户名或密码错误', :unauthorized
        # 401  http 状态码 Unauthorized
        # render json: { errors: '用户名或密码错误' }, status: :unauthorized
      end
    rescue Exception => e
      Rails.logger.info(e)
      return_data '', 400, '密码错误,服务出现异常,请重试', :unauthorized
    ensure

    end

  end

end