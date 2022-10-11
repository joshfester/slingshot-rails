# frozen_string_literal: true

module Admin
  # Administrate users
  class UserPolicy < Admin::ApplicationPolicy
    def index?
      %w[admin super_admin].include? @user&.role
    end
  end
end
