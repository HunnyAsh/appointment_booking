class ApplicationController < ActionController::Base
  layout :layout_by_resource

  private

  def after_sign_in_path_for(resource)
    resource.is_a?(Doctor) ? doctor_appointments_path(resource) : patient_appointments_path(resource)
  end

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :doctor
      new_doctor_session_path
    elsif resource_or_scope == :admin
      new_patient_session_path
    else
      root_path
    end
  end
end
