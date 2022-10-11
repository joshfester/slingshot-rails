# frozen_string_literal: true

module Admin
  # Administrate controller with no ActiveRecord resource
  class DashboardsController < Admin::ApplicationController
    def index; end
  end
end
