module Web
  class BaseApi < Grape::API
    #vendor 目录位置
    version 'v1', using: :header, vendor: 'web'
    # version 'v1', using: :path
    format :json
    # prefix :api

    helpers CommonapiHelper

    #所有v1版本的接口 的挂载 入口
    mount V1::MountApi

  end
end