class WelcomeController < ApplicationController
  def index
    # 课后题 1.假设有一个Teacher类，Teacher.first 和 Teacher.new的区别
    #
    # render_data= Teacher.first
    #<Teacher id: 1, name: "huang,", age: 20, description: "ruby/js", created_at: "2022-05-10 08:17:16.037854000 +0000", updated_at: "2022-05-10 08:17:16.037854000 +0000">
    # render_data=Teacher.new
    #<Teacher id: nil, name: nil, age: nil, description: nil, created_at: nil, updated_at: nil>
    # Teacher.first 查询了Teacher表的第一条数据，并且返回 该数据
    # Teacher.new 相当于是实例化了Teacher类，并且 会自动的 生成 实例变量 的 set 和 get 方法
    #
    #
    # 课后题 2.sql中的select/where/group/count/having/order/limit,是否需要一个语句中写完，是否有顺序？
    # 不需要在一条语句中写完,如下所示
    # teacher_info = Teacher.select(:id, :name)
    # teacher_info.order(id: :desc)
    # render_data=teacher_info.first
    #
    #
    # 没有顺序关系
    # 虽然没有顺序关系，但是还是要按照sql的一般书写规则去写 ，比如 limit 放在最后。。。。。
    # render_data=Teacher.select(:id,:name).order(name: :desc).where(id: 1).limit(1).first
    # render_data=Teacher.order(name: :desc).limit(1).select(:id, :name).first
    #
    #
    # 课后题3.创建测试数据方式
    # 1.可以使用seed批量，
    # 2.也可以在 rails console中 create，
    # 3.自己 写一个 脚本 利用 ActiveRecord::Base.connection.execute 或来创建
    #
    #

    #写一个方法，统计各个年龄老师人数
    # statistics_of_teachers
    #
    #写一个方法，算出所有老师的年龄平均值
    # composite_life
    #
    #
    # 写一个方法，根据所传年龄找出对应的老师记录（按name排序），并返回对应数量
    # teacher_age_search(20)
    #
    #
    # 写一个方法，根据关键字，搜索description·，比如搜索js，返回【‘huang-20’,'chen-20','zeng-26'】
    #
    # search_description('js')
    #
    #
    # 写一个方法,根据记录ID，标记is_free的情况,批量更新多个
    # mark_free(1,2,3)
    #
    #
    # 写一个方法,根据记录ID,批量删除多个, 一般不会删除数据的，都是逻辑删除
    # batch_deletion(1,2,3)
    #
    #
    # 定义一个方法，格式化记录显示，只显示 name，age,description
    # formatted_display(1,2,3)
    #
    #
    #
    #
    # #定义一个方法,在每个年龄中，各自找出一个老师
    # find_age_teacher
    #
    #
    #
    # 定义一个方法,传递一个名字，判断记录是否存在，不存在，插入，返回数据
    # write_does_not_exist('liufeng')
    #
    #
    # 写一个方法，进行列表查询，支持排序和分页
    # per_page(order: :name, page_size: 10, currp_page: 1)
    #
    #
  end

  #写一个方法，统计各个年龄老师人数
  def statistics_of_teachers
    render_data = Teacher.select("count(1) as sum", :age).group(:age)
    return_data(render_data)
  end

  #写一个方法，算出所有老师的年龄平均值
  def composite_life
    render_data = Teacher.select("avg(age) as avg_age").first.avg_age.floor #23
    return_data(render_data)
  end

  #写一个方法，根据所传年龄找出对应的老师记录（按name排序），并返回对应数量
  def teacher_age_search(search_age)
    teacher_data = Teacher.select(:id, :name).where(age: search_age).order(name: :asc)
    hash_data = { total_num: teacher_data.size, data: teacher_data }
    return_data(hash_data)
  end

  #写一个方法，根据关键字，搜索description·，比如搜索js，返回【‘huang-20’,'chen-20','zeng-26'】
  def search_description(desc_search)
    #方式一
    # teacher_data = Teacher.select(:id, :name, :age)
    #                       .where('description like ?', "%#{desc_search}%")
    #                       .map { |item| item[:name].to_s + "-" + item[:age].to_s }
    #
    #方式二
    teacher_data = Teacher.select(:id, :name, :age)
                          .where('description like ?', "%#{desc_search}%")
                          .pluck(:name, :age)
                          .map { |item| item.join('-') }
    return_data(teacher_data)
  end

  #根据记录ID，标记is_free的情况,批量更新多个
  def mark_free(*ids)
    result = Teacher.where("id in (?)", ids).update_all(is_free: 1)
    return_data(result)

  end

  #根据记录ID,批量删除多个, 一般不会删除数据的，都是逻辑删除
  def batch_deletion(*ids)
    result = Teacher.where("id in (?)", ids).delete_all

    return_data(result)
  end

  #定义一个方法，格式化记录显示，只显示 name，age,description
  def formatted_display(*ids)
    teacher_data = Teacher.select(:name, :age, :description).where("id in (?)", ids)
                          .map { |item| { name: item[:name], age: item[:age], description: item[:description] } }
    return_data(teacher_data)
  end

  #定义一个方法,在每个年龄中，各自找出一个老师
  def find_age_teacher
    render_data = Teacher.group(:age)
    return_data(render_data)
  end

  #传递一个名字，判断记录是否存在，不存在，插入，返回数据
  def write_does_not_exist(search_name)
    exist_user = Teacher.find_by(name: search_name)
    #用户不存在
    unless exist_user
      exist_user = Teacher.create(name: search_name)
    end
    return_data(exist_user)
  end

  #写一个方法，进行列表查询，支持排序和分页
  # sort 排序字段
  # page_size 每页条数
  # curr_page 当前页 ,例如 1 第一页，以此类推
  def per_page(**args)
    offset_current = args[:currp_page] - 1
    offset_current = (offset_current < 0) ? 0 : offset_current
    offset_size = offset_current * args[:page_size]
    teacher_data = Teacher.select(:id, :name, :age).order("#{args[:order]}": :desc).limit(args[:page_size]).offset(offset_size)
    return_data(teacher_data)
  end
end
