# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :profile, as: :profileable
  has_many :appointments
  has_many :doctors, through: :appointments
end
