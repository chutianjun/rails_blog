#全局引入redis,进行连接
redis_server= Rails.application.config_for(:redis_database)
$redis = Redis.new(host: redis_server.host, port: redis_server.port)
$redis.auth(redis_server.password)
$redis.select(redis_server.data)
