# app/controllers/students_controller.rb
class StudentsController < ApplicationController
  def index
    stadents = Student.all
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
