# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :set_patient

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: 'patient created successfully!!'
    else
      render :new, notice: 'patient not created. Try Again!!'
    end
  end

  def show; end

  def edit; end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Patient updated successfully!!'
    else
      render :edit, notice: 'Patient not updated. Try again!!'
    end
  end

  def destroy
    if @patient.destroy
      redirect_to patients_path, notice: 'patient destroyed successfully!'
    else
      render :index, notice: 'patient not detsroyed.'
    end
  end

  private

  def set_patient
    @patient = Patient.find_by(id: params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :contact_no, :address)
  end
end
