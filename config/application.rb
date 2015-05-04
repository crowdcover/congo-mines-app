require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ActiveScaffold
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'en'
  end
end

  #fix_cp1252_utf8(text)
class String
  def fix_encoding
    self.encode('cp1252',
                :fallback => {
                  "\u0081" => "\x81".force_encoding("cp1252"),
                  "\u008D" => "\x8D".force_encoding("cp1252"),
                  "\u008F" => "\x8F".force_encoding("cp1252"),
                  "\u0090" => "\x90".force_encoding("cp1252"),
                  "\u009D" => "\x9D".force_encoding("cp1252")
                })
        .force_encoding("utf-8")
  end
end  

# to remove chars
# chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s


