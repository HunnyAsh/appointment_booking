# frozen_string_literal: true

class DoctorsController < ApplicationController
  before_action :set_doctor

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path, notice: 'Doctor created successfully!!'
    else
      render :new, notice: 'Doctor not created. Try Again!!'
    end
  end

  def show; end

  def edit; end

  def update
    if @doctor.update(doctor_params)
      redirect_to edit_doctor_path(@doctor), notice: 'Doctor updated successfully!!'
    else
      render :edit, notice: 'Doctor not updated. Try again!!'
    end
  end

  def destroy
    if @doctor.destroy
      redirect_to doctors_path, notice: 'Doctor destroyed successfully!'
    else
      render :index, notice: 'Doctor not detsroyed.'
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find_by(id: params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :contact_no, :speciality, :from_time, :to_time, profile_attributes: [ :dob ])
  end
end
