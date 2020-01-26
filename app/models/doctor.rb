# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_one :profile, as: :profileable
  has_many :appointments
  has_many :patients, through: :appointments
end
