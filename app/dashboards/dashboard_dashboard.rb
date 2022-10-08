require "administrate/custom_dashboard"

class DashboardDashboard < Administrate::CustomDashboard
  resource "Dashboards" # used by administrate in the views

  def display_resource(user)
    'Dashboard'
  end
end