#如果常量没有定义 uninitialized constant ApiApplication ,第二种解决方式,直接加载文件
#项目根路径
# dir_path="#{Rails.root}"
# file_path=dir_path+'/app/api/web/ApiApplication.rb'
# require file_path
# require '/mnt/rcc/blog/app/api/web/ApiApplication.rb'
desc "API Routes"

task :api_routes => :environment do
  ApiApplication::Base.routes.each do |api|
    prefix = '/api/web'
    method = api.route_method.ljust(10)
    path = api.route_path
    puts "#{method} #{prefix}#{path}"
  end
end