require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ForClimbers
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    config.generators do |g| 
    #rails generateコマンドを使う際にrspec用のスペックファイルも一緒に作るかどうかの設定。
    #modelとcontrollerスペックの定形コードはデフォルトで自動的に作成される。
      g.test_framework :rspec,
       fictures: false,
       view_specs: false,
       helper_specs: false,
       routing_specs: false
     end
    config.i18n.default_locale = :ja # エラーメッセージの日本語化
  end
end
