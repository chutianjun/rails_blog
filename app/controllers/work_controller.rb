class WorkController < ApplicationController
  def index
    #create
    #1.对create,update,save等方法 多加练习
    #
    # Teacher.create(name: '刘老师', age: 28, description: 'php')
    #
    # save
    # teacher=Teacher.new
    # teacher.name='王老师'
    # teacher.age=80
    # teacher.description=80
    # teacher.save

    #update
    # upteacher=Teacher.first
    # upteacher.update(age: 90)
    # Teacher.where("id in (?)", [1,2]).update_all(is_free: 1)

    #2.写一个scope,查询年龄为18的学生
    # return_data scopequery(18)
    #
    #
    #
    #
    #
    # 3.利用关联,查询 老师名下,年龄 为18的学生
    # return_data teacher_student(1,18)


    #4.创建表teacher_structures,有字段teacher_id,super_id,写出关联关系
    # return_data teacher_up_and_down

    #5.写出一个验证,student不允许存入年龄为负数的 数据
    # return_data verify_negative_age

    # 6.写出一个回调,当teacher表数据修改时,如果老师年龄大于60,对应学生的状态改为不活跃
    # Teacher.find(7).update(age: 70)
    #
    #
    #
    #
    #
    # 7.将teacher数据更改放入事务中,如果学生改为不活跃失败,回滚
    # teacher_affairs
    #
    #
    #
    #
    # 8,将teacher表和student表设置为,删除老师,则删除他的所有学生
    # 此处的 teacher 和 student 在模型中  我都设置了 关联删除
    # Teacher.find(9).destroy
    # Student.find(4).destroy
    #
    #
    #
    # 9.将以下原生sql转换为rails查询
    # select * from teachers where name = '张三'
    #
    # return_data Teacher.where(name: '张三').to_sql #  "SELECT `teachers`.* FROM `teachers` WHERE `teachers`.`name` = '张三'"
    #
    # select * from teachers where name = '张三' and age = 18
    #
    # return_data Teacher.where(name: '张三', age: 18).to_sql #"SELECT `teachers`.* FROM `teachers` WHERE `teachers`.`name` = '张三' AND `teachers`.`age` = 18"
    #
    # select s.* from teachers t inner joins students s on t.id = s.teacher_id where t.name = '张三'
    #
    # 方式一:
    # return_data Teacher.from('teachers t').joins("students s on t.id=s.teacher_id").where("t.name='张三'").to_sql
    #
    # 方式二:
    # return_data Teacher.joins(:students).where("teachers.name='张三'").to_sql
    #
    #
    #
    #
    # 10.查询年龄大于18的学生和  学生的老师的信息,返回json
    # return_data search_student(18)
    #
    #
    #
    # 11,有一张employee员工表,自关联 有上下级的关系 ,我这里用partent_id 作为 父级ID
    #
    # (1)找出 某几个 员工 的 上级 的 所有 下级,这里 已经避免了N+1
    # return_data self_association(5, 15)
    #
    # (2)通过一条语句查询出来(1)的结果
    # return_data left_association(5, 15)
    #
    # (3)查询出某个人的所有上级,一直到最顶层
    # return_data top_assocation(20)
    #
    # (4)获取所有的员工数据,生成公司员工的树状结构,这条 要求 是 没有的 ,我写都写了,干脆加一个 生成 树状结构
    # return_data get_all_tree
    #
  end




  #2.写一个scope,查询年龄为18的学生
  def scopequery(age)
    Student.query_age(age)
  end

  # 3.利用关联,查询 老师名下,年龄 为18的学生
  def teacher_student(teacher_id,search_age)
    Teacher.find(teacher_id).students.where(age: search_age)
  end

  #4.创建表teacher_structures,有字段teacher_id,super_id,写出关联关系
  def teacher_up_and_down
    # 查询老师ID为 3 的上级数据
    super_data=Teacher.find(3).super_teacher_structure
    #查询老师ID为1 的 所有下级数据
    lower_data=Teacher.find(1).lower_teacher_structure

    { super_data: super_data, lower_data: lower_data}
  end


  #5.写出一个验证,student不允许存入年龄为负数的 数据
  def verify_negative_age
    student=Student.new
    student.name='叶梵'
    student.age=-1
    student.teacher_id=1
    student.save
    student.errors.messages.flatten.join('-') #"age-抱歉,年龄不能为负数"
  end


  # 7.将teacher数据更改放入事务中,如果学生改为不活跃失败,回滚
  def teacher_affairs
    # 开启事务
    begin
      #rails里 似乎 默认 就是开启了事务的.查看sql执行可以看到 TRANSACTION 开启 以及  ROLLBACK
      ActiveRecord::Base.transaction do
        Teacher.find(7).update(age: 80)
      end
    rescue Exception => e
      p e.to_s  # 我故意修改错了字段,抛出异常如下  "Mysql2::Error: Unknown column 'students.is_active1' in 'field list'"
    ensure
      p '执行完毕'
    end
  end



  #自关联,找出 某几个 员工 的 上级 的 所有 下级
  def self_association(*ids)
    #includes 避免了 n+1 , rails 底层会 先 in 查询 出所有,然后 再根据 关联 来 计算
    Employee.where("id in (?)", ids).includes(:parent => [:children]).map do |item|
      parent_data = item.parent.attributes.dup
      parent_data['team_member'] = item.parent.children
      { team_info: parent_data }
    end
  end

  #通过一条语句查询出来(1)的结果
  def left_association(*id)
    tree_init(Employee.select("eb.*")
                      .from('employees as ea')
                      .joins('right join employees as eb on (ea.parent_id=eb.parent_id or ea.parent_id=eb.id)')
                      .where("ea.id in (#{id.join(',')})"))
  end

  #获取 公司 员工的 树形结构
  def get_all_tree
    tree_init(Employee.all)
  end

  #将数据转换为树形结构
  def tree_init(data)
    @hash_data = data.each_with_object({}) do |(item, key), hash_item|
      hash_item[item.id] = item.attributes.dup
    end
    tree = []
    @hash_data.each do |key, item|
      if @hash_data[item["parent_id"]]
        unless @hash_data[item["parent_id"]]['team_member']
          @hash_data[item["parent_id"]]['team_member'] = []
        end
        @hash_data[item["parent_id"]]["team_member"] << @hash_data[item["id"]]
      else
        tree << @hash_data[item["id"]]
      end
    end
    tree
  end

  # 查询出某个人的所有上级,直到最顶层,如果要获取这种层级关系,最好在新增数据的时候, 在 数据库中记录一个 层级的 关系链条 字段
  # 这里 就 动态获取层级 了,因为  也不确定到底有几层关系
  def top_assocation(member_id)
    all_data = []
    #loop在使用的时候要非常注意,记得break,别搞成死循环
    loop do
      unless @item
        @item = Employee.find(member_id)
      end
      # 存在父级,继续向上查找
      if @item.parent_id > 0
        @item = @item.parent
        all_data.push(@item)
      else
        break
      end
    end
    all_data
  end

  #查询年龄大于18的学生和  学生的老师的信息,返回json
  def search_student(age)
    Student.where(" age>= ?", age).includes(:teacher).map do |item|
      { name: item.name, age: item.age, id: item.id, teacher_id: item.teacher.id, teacher_name: item.teacher.name }
    end
  end
end
