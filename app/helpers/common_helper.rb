module CommonHelper
    #打印参数
    def self.dd(*args)
      p "common_log start"
      p "*"*30
      args.each { |item| p item}
      p "*"*30
      p "common_log end"
      exit
    end


    def self.dump(*args)
      p "common_log start"
      p "*"*30
      args.each { |item| p item}
      p "*"*30
      p "common_log end"
    end
end