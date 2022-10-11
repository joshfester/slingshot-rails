# frozen_string_literal: true

require 'administrate/custom_dashboard'

# This is just for the /admin/dashboard page
class DashboardDashboard < Administrate::CustomDashboard
  resource 'Dashboards' # used by administrate in the views

  def display_resource(_user)
    'Dashboard'
  end
end
