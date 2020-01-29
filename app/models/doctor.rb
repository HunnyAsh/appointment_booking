# frozen_string_literal: true

class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, as: :profileable, dependent: :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true
  has_many :appointments
  has_many :patients, through: :appointments
end
