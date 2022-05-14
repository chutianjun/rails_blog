module Web
  module V1
    class WebApiBase < Grape::API
      # inherited 钩子，一旦有 子类继承  inherited 钩子就会 被触发
      def self.inherited(subclass)
        super
        #class_eval 来 打开 扩展类, 例如扩展 StudentApi 类 ,在类中 添加 /调用 实例 方法 ,定义 属性
        subclass.class_eval do
          version 'v1', using: :path
          format :json
          #before 类似于 Rails 里的 before_filter, 任何继承 API 类在都会在日志中记录 params 和 headers 信息
          before do
            Rails.logger.debug "===> params is: #{params.inspect}\n===> headers is: #{headers.inspect}"
          end
        end
      end
    end
  end
end
