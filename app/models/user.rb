class User < ApplicationRecord
  has_many :services
  has_many :comments
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
  # This method will be our insurance that the user can only login when he/she is not deactivated.
  def active_for_authentication?
    # raise "deactive check true"
    super && !deactive
  end

  # override the User destroy method
  # when destroy method is called on User model, we are updating the User’s deactive column to true only if the user is not currently deactivated.
  def destroy
    # raise "ss"
    update_attributes(deactive: true) unless deactive
  end
end
