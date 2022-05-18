module CommonapiHelper
  def printasterisk
    p "*" * 15 + Time.now.to_s + '*' * 15
  end

  def dd(*args)
    printasterisk
    args.each_with_index { |item, index| p 'param ' + (index+1).to_s + ":"; p item; p '-'*30 }
    printasterisk
    exit
  end

  def dump(*args)
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


  def raise_json(**args)
    raise_json = args.to_json
    raise raise_json
  end

end