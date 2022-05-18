module Helpers
  module UserHelper
    #保存用户
    def save_user(user)
      begin
        #开启事务
        ActiveRecord::Base.transaction do
          User.create!(username: user[:name], addr: user[:addr], age: user[:age], birth: user[:birth], sex: user[:sex])
        end
      rescue Exception => e
        Rails.logger.info(e)
      ensure
      end
    end

    #修改用户
    def edit_user(user)
      begin
        #开启事务
        ActiveRecord::Base.transaction do
          User.find_by_id(user[:id]).update(username: user[:name], addr: user[:addr], age: user[:age], birth: user[:birth], sex: user[:sex])
        end
      rescue Exception => e
        #记录错误日志
        Rails.logger.info(e)
      ensure
      end
    end

    #删除用户
    def del_user(user)
      begin
        #开启事务
        ActiveRecord::Base.transaction do
          User.find_by_id(user[:id]).update(delete_time: Time.now)
        end
      rescue Exception => e
        #记录错误日志
        Rails.logger.info(e)
      ensure
      end
    end

    #用户列表
    def user_list(params)
      begin
        #用户总数
        user_total = User.count
        #搜索用户
        user_search = User.select(:id, :username, :birth, :age, :addr, :sex).where(delete_time: 0)
        #多个where条件拼接,使用方式
        # 1.使用scope
        # 2.使用where!,改变原来的sql 查询
        user_search.where!('name like ? ', "%#{params[:name]}%") unless params[:name].blank?
        #当前页数
        params[:page] ||= 1
        #每页条数
        params[:pagesize] ||= 10
        offset_current = params[:page] - 1
        offset_current = (offset_current < 0) ? 0 : offset_current
        offset_size = offset_current * params[:pagesize]
        user_search.limit!(params[:pagesize]).offset!(offset_size)
        { user_data: user_search, total: user_total }
      rescue Exception => e
        Rails.logger.info(e)
      ensure

      end
    end
  end
end
