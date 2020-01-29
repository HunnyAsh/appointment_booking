module ApplicationHelper
  def destroy_session_path
    current_doctor ? destroy_doctor_session_path : destroy_patient_session_path
  end

  def profiles_path
    current_doctor ? doctor_path(current_doctor) : patient_path(current_patient)
  end
end
