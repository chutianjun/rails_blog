module Web
  module V1
    #v1 版本所有api 接口的 总 挂载类
    class MountApi < Grape::API
      #挂载学生接口
      mount Users::StudentApi
    end
  end
end
