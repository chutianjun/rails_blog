module CommonConcern
  module OpeartionAction
    def return_data(rcode = 200, rmsg = '操作成功', rdata)
      render json: {
        code: rcode,
        msg: rmsg,
        data: rdata
      }
    end
  end
end