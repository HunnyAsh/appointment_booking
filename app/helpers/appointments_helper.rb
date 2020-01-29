module AppointmentsHelper
  def doctor_names
    Doctor.all.pluck(:email, :id)
  end
end
