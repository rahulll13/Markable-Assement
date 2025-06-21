class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    def full_name
      "#{first_name} #{last_name}"
    end
    def full_name_and_speciality
      "#{first_name} #{last_name} - #{speciality}"
    end
    validates :role, presence: true, inclusion: { in: ['doctor', 'receptionist'] }
    validates :first_name, :last_name, presence: true
    has_many :registered_patients, class_name: 'Patient', foreign_key: 'registered_by_id'
    has_many :patients, foreign_key: 'doctor_id'
  end
  