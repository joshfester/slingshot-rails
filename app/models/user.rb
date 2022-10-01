class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
    :registerable,
    :recoverable, 
    :rememberable, 
    :validatable

  enum role: {
    subscriber: 0,
    editor: 1,
    admin: 2
  }

  def can_view_admin?
    ['editor', 'admin'].include? self.role
  end

end
