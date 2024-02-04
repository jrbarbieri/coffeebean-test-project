require 'redis'

if ENV["REDISCLOUD_URL"]
  $redis = Redis.new(:url => ENV["REDISCLOUD_URL"] || 'redis://localhost:6379/1')
end
