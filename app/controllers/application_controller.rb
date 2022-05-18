class ApplicationController < ActionController::API

  attr_accessor :current_user
  include CommonConcern

  #受保护

  protected

  def auth_user!
    begin
      token?
      @current_user = User.find_by(id: auth_token[:user_id])
    rescue JWT::ExpiredSignature
      render_failed '授权已过期'
    rescue JWT::VerificationError, JWT::DecodeError
      render_failed '授权错误'
    rescue Exception
      render_failed '服务器错误'
    end
  end

  #私有

  private

  def render_failed(messages = 'token验证失败')
    return_data '', 400, messages, :unauthorized
  end

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
                      request.headers['Authorization'].split(' ').last
                    end
  end

  def auth_token
    @auth_token ||= Token.decode(http_token)
  end

  def token?
    http_token && auth_token && auth_token[:user_id].to_i
  end

end
