class Admin::UserPolicy < Admin::ApplicationPolicy

  def index?
    ['admin', 'super_admin'].include? @user&.role
  end

end
