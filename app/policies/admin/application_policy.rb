# frozen_string_literal: true

module Admin
  class ApplicationPolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    def index?
      @user.editor? || @user.admin?
    end

    def show?
      index?
    end

    def create?
      index?
    end

    def new?
      index?
    end

    def update?
      index?
    end

    def edit?
      index?
    end

    def destroy?
      index?
    end

    def bulk?
      index?
    end

    class Scope
      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        @scope
      end

      private

      attr_reader :user, :scope
    end
  end
end
