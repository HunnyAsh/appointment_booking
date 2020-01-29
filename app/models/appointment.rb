class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def is_booked?
    time.between?(doctor.from_time, doctor.to_time)
  end

  def any_appointments_in_avail_time?
    return false unless doctor.appointments.present?
    booked_times = doctor.appointments.pluck(:time)
    booked_times.include?(time)
  end
end
