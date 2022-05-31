url = 'redis://localhost:6379/12'
namespace = 'ripplFeed'

Sidekiq.configure_server do |config|
  config.redis = { url: url, namespace: namespace }
end

Sidekiq.configure_client do |config|
  config.redis = { url: url, namespace: namespace }
end
