# frozen_string_literal: true

module Admin
  # Administrate controller with no ActiveRecord resource
  class DashboardsController < ApplicationController

    def index
      
      @services = [
        {
          title: 'Honeybadger',
          description: 'Error tracking',
          url: 'https://www.honeybadger.io/',
          api_key: ENV.fetch('HONEYBADGER_API_KEY', nil),
          js_key: ENV.fetch('HONEYBADGER_JS_KEY', nil)
        },
        {
          title: 'Sendgrid',
          description: 'Send emails',
          url: 'https://sendgrid.com/',
          api_key: ENV.fetch('SENDGRID_API_KEY', nil)
        },
        {
          title: 'Skylight',
          description: 'Performance monitoring',
          url: 'https://www.skylight.io/',
          api_key: ENV.fetch('SKYLIGHT_AUTHENTICATION', nil)
        }
      ]

    end

  end
end
