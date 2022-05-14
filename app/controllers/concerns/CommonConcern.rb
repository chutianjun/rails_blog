module CommonConcern
  module OpeartionAction
    def return_data(rdata='',rcode = 200, rmsg = '操作成功')
      render json: {
        code: rcode,
        msg: rmsg,
        data: rdata
      }
    end
  end
end