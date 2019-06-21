class User < ApplicationRecord
  has_many :posts
  has_many :audit_logs
  has_many :staffs_associations, class_name: 'Staff'
  has_many :staffs, through: :staffs_associations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :phone, :ssn, :company

  PHONE_REGEX = /\A[0-9]*\Z/

  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: { is: 10 }
  validates :ssn, length: { is: 4 }
  validates_numericality_of :ssn

  scope :employee, -> { where(type: nil) }

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
