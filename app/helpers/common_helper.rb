module CommonHelper
  def self.printasterisk
    p "*" * 15 + Time.now.to_s + '*' * 15
  end

  def self.dd(*args)
    printasterisk
    args.each_with_index { |item, index| p 'param ' + (index+1).to_s + ":"; p item; p '-'*30 }
    printasterisk
    exit
  end

  def self.dump(*args)
    printasterisk
    args.each_with_index { |item, index| p 'param ' + (index+1).to_s + ":"; p item; p '-'*30 }
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