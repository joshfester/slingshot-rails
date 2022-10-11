# frozen_string_literal: true

module Admin
  # All Administrate controllers inherit from this
  # `Administrate::ApplicationController`, making it the ideal place to put
  # authentication logic or other before_actions.
  #
  # If you want to add pagination or other controller-level concerns,
  # you're free to overwrite the RESTful controller actions.
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!

    # Instead of Administrate's Puditize class, use namespaces
    # https://github.com/thoughtbot/administrate/issues/1332#issue-437030117
    include Pundit::Authorization

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def policy_scope(scope)
      super([:admin, scope])
    end

    def authorize(record, query = nil)
      super([:admin, record], query)
    end

    def scoped_resource
      policy_scope super
    end

    def authorize_resource(resource)
      authorize resource
    end

    def show_action?(action, resource)
      Pundit.policy!(pundit_user, [:admin, resource]).send("#{action}?".to_sym)
    end
  end
end
