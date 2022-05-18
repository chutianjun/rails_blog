class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 30, commit: '名称'
      t.string :addr, limit: 255, commit: '地址'
      t.boolean :age, limit: 3, commit: '年龄'
      t.date :birth, commit: '生日'
      # 关于 boolean 类型  有个 坑,如果limit 长度不写,它在数据库中 ,类型是tinyint,默认长度是1,
      # 在取数据的时候,它默认 就会转换为 boolean值,true/false,如果要取得数据库中的 真实 值,这里设置长度为 3
      t.boolean :sex, limit: 3, commit: '性别'
      t.integer :delete_time, commit: '删除时间', default: 0
      t.string :email, commit: '邮箱'
      #jwt 认证
      t.string :password_digest, commit: '密码摘要'
      t.timestamps
    end
  end
end
