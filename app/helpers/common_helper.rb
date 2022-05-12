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

    #生成树状图相关
    class Tree
      #将数据转换为树形结构
      def self.tree_init(data)
        @hash_data = data.each_with_object({}) do |(item, key), hash_item|
          hash_item[item.id] = item.attributes.dup
        end
        tree = []
        @hash_data.each do |key, item|
          if @hash_data[item["parent_id"]]
            unless @hash_data[item["parent_id"]]['team_member']
              @hash_data[item["parent_id"]]['team_member'] = []
            end
            @hash_data[item["parent_id"]]["team_member"] << @hash_data[item["id"]]
          else
            tree << @hash_data[item["id"]]
          end
        end
        tree
      end
    end

end