require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # 自动加载目录
    # web_url="#{Rails.root}/app/api/web"
    # web_add_arr=[
    #   web_url,
    #   web_url+'/v1',
    #   web_url+'/v1/users',
    # ]
    # web_add_arr.each { |x| config.autoload_paths.push(x)}
    #
    #
    #
    # 官方提示 rails6 以上 ,在config/application.rb 下添加
    # ActiveSupport::Inflector.inflections(:en) do |inflect|
    #   inflect.acronym 'API'
    # end
    #
  end
end
