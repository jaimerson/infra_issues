class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable, :validatable

  enum role: {
    reporter: 0,
    staff: 1,
    admin: 2
  }

  has_many :issues, foreign_key: :reported_by

  before_save :set_role

  private

  def set_role
    self.role ||= :reporter
  end
end
