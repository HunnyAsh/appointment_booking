class MyDeviseController < ApplicationController
  layout 'login'
  before_action :authenticate_doctor!
end
