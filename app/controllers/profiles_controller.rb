class ProfilesController < ApplicationController
  before_action :set_resource
  def index
  end
  def update

    binding.pry
  end

  private

  def set_resource
    @resource = params[:patient_id] ? Patient.find_by(id: params[:patient_id]) : Doctor.find_by(id: params[:doctor_id])
  end

  def patient_params
    params.require(:profile).permit(:dob)
  end
end
