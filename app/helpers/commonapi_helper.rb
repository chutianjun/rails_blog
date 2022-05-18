module CommonapiHelper
  def printasterisk
    p "*" * 15 + Time.now.to_s + '*' * 15
  end

  def dd(*args)
    printasterisk
    args.each { |item| p item }
    printasterisk
    exit
  end

  def dump(*args)
    printasterisk
    args.each { |item| p item }
    printasterisk
  end

  # grape 通用返回数据 格式
  def return_data(rdata = '', rcode = 200, rmsg = '操作成功')
     {
       code: rcode,
       msg: rmsg,
       data: rdata
     }
  end
end