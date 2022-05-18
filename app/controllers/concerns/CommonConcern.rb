module CommonConcern
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

  # rcode 自定义标识码 ,默认 200 成功
  # status http状态码 ,默认 200 ok
  def return_data(rdata = '', rcode = 200, rmsg = '操作成功', status = :ok)
    render json: {
      code: rcode,
      msg: rmsg,
      data: rdata
    }, status: status
  end
end

