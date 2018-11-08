class User < ApplicationRecord
  has_many :services
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #ActiveRecord::Validations::ClassMethods
  # validates_uniqueness_of(*attr_names)
  # activerecord/lib/active_record/validations/uniqueness.rb
  # Validates whether the value of the specified attributes are unique across the system.
  validates_uniqueness_of :username
  # they’ll only get deactivated. Still, we have to forbid them from logging in
  def active_for_authentication?
    super && !deactivated
  end
end
