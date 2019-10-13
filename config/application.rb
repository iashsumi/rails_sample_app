require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    # locale
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    # 対象のコントローラのヘルパーのみ読み込む
    config.action_controller.include_all_helpers = false
    # バリデーション時にラジオボタンのレイアウトが崩れるためfield_with_errorsを出力しないように設定
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end
