# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* 运行流程介绍

* 1.第一步,将config/database.example.yml 复制一份 命名为 为 database.yml,这里数据库 使用的是mysql, 文件 database.yml 我已经忽略掉 了,每个人的环境都不太一样
* 拷贝数据库示例文件,修改host,username,password 等 即可

* 2.第二步,
* 运行 ails db:create RAILS_ENV='development' 生成数据库
* 运行 rails db:migrate 生成表结构
* 运行 rails db:seed 填充对应的数据

* 3.第三步,直接在 命令行 运行 rails s ,访问 127.0.0.1:3000 即可
* 
* 4.作业相关: 此处没有 过多的业务,有的就一句话,所以 放在了一起,没有拆分
* 
* 作业1: sql增删改查相关
* 代码位置:
* /app/welcome_controller.rb
* 访问 127.0.0.1:3000 
* 
* 
* 作业2,关联,scope,生命周期,回调等
* 代码位置:
* /app/work_controller.rb
* 访问 127.0.0.1:3000/work