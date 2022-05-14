class EmployeeTestApi < BaseApi
  namespace :employee do
    desc '获取员工信息'
    params do
      #requires 必填
      requires :id, type: Integer, desc: 'ID'
      #optional 可选  default 默认值, values 默认值的 范围, 如果设置了 values ,那么 default 必须在values之中,否则 报错 如下 default: 王老板 is incompatible with values: ["王老板1", "营销主管"]
      optional :name, type: String, desc: '用户名称', default: '王老板', values: ['', '王老板', '营销主管']
    end
    # url  http://127.0.0.1:3000/coursetest/employee/user_info?id=1
    get :user_info do
      return_data Employee.where(id: params[:id], name: params[:name])
    end

    desc 'post员工测试'
    params do
      requires :parent_id, type: Integer, desc: 'ID'
      optional :text, type: String, desc: '描述', regexp: /\A[a-z]+\z/

      #这里的group是 requires的 alias 别名, 源码 就是 alias group requires
      #
      # type是必填的,如果缺少 会 报异常 MissingGroupTypeError: Grape::Exceptions::MissingGroupTypeError>
      group :group_params_coll, type: JSON do
        requires :url, type: String, desc: 'url地址'
      end

      #可选参数1
      optional :optional_params_coll_one, type: JSON, desc: '可选参数1' do
        requires :format, type: Symbol, values: [:mp3, :wav, :aac, :ogg], default: :mp3
      end
      #可选参数2
      optional :optional_params_coll_two, type: JSON, desc: '可选参数2' do
        requires :format, type: Symbol, values: [:a, :b, :c, :d], default: :a
      end

      # 这两个 可选 参数是互相排斥的 , 也就是说,只需要其中一个 就行 ,如果都传了, 反而 会报错  "error": "optional_params_coll_one, optional_params_coll_two are mutually exclusive"
      mutually_exclusive :optional_params_coll_one, :optional_params_coll_two # 互斥
    end
    # url如下:  http://127.0.0.1:3000/coursetest/employee/create_employee
    post :create_employee do
      Rails.logger.info(params)
      # {"id"=>1, "text"=>"abc", "group_params_coll"=>{"url"=>"abc.com"}}
      return_data params
    end
  end
end
