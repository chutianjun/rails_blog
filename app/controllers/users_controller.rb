class UsersController < ApplicationController
  #前置过滤器,校验token 是否正确
  before_action :auth_user!

  def index
    return_data current_user
  end

end