module Web
  class BaseApi < Grape::API
    #vendor 目录位置
    version 'v1', using: :header, vendor: 'web'
    # version 'v1', using: :path
    format :json
    # prefix :api

    helpers CommonapiHelper

    mount V1::Users::StudentApi

    resource :grade_schools do
      desc '获取学生'
      get :index do
        Student.limit(20)
      end
    end
  end
end