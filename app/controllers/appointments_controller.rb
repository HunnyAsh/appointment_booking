class AppointmentsController < ApplicationController
  before_action :set_resource
  def index
    @appointments = @resource.appointments if @resource.present?
  end

  def new
    @appointment = @resource.appointments.build
  end

  def create
    @appointment = @resource.appointments.new(appointment_params)
    is_booked = @appointment.is_booked?
    if is_booked && @appointment.any_appointments_in_avail_time?
      @appointment.errors.add(:time, "You can choose other time from #{@appointment.doctor.from_time} to #{@appointment.doctor.to_time}.")
      render :new, notice: @appointment.errors.full_messages
    else
      if @appointment.save
        redirect_to patient_appointments_path(@resource), notice: 'Appointment booked successfully!!'
      else
        render :new, notice: @appointment.errors.full_messages
      end
    end
  end

  def accept
    appointment = @resource.appointments.find_by(id: params[:appointment_id])
    appointment.update(accept: params[:accept])
    redirect_to doctor_appointments_path(@resource), notice: 'Appointment accepted successfully!!'
  end

  private

  def set_resource
    @resource = params[:patient_id] ? Patient.find_by(id: params[:patient_id]) : Doctor.find_by(id: params[:doctor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :time, :doctor_id)
  end
end
