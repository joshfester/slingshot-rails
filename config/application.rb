# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
# require "active_job/railtie"
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
# require "action_text/engine"
require 'action_view/railtie'
# require "action_cable/engine"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Slingshot
  # The Rails Application clas
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.action_view.field_error_proc = proc do |html_tag, _instance|
      if html_tag.starts_with? '<label'
        html_tag.html_safe # rubocop:disable Rails/OutputSafety
      else
        html_tag
          .gsub('form-control', 'form-control is-invalid')
          .gsub('form-select', 'form-select is-invalid')
          .gsub('form-check-input', 'form-check-input is-invalid')
          .html_safe # rubocop:disable Rails/OutputSafety
      end
    end
  end
end
