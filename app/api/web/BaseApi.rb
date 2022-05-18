module Web
  class BaseApi < Grape::API
    #vendor 目录位置
    version 'v1', using: :header, vendor: 'web'
    # version 'v1', using: :path
    format :json
    # prefix :api

    helpers CommonapiHelper

    #挂载 V1版本的 所有接口
    mount V1::WebApiBase

  end
end