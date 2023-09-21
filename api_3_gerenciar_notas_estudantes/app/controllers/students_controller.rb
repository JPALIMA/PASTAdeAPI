#app/controllers/students_controller.rb
class StudentController < ApplicationController
  def index
    students = Student.all
    render json: students
  end
  
  def show 
    student = Student.find(params[:id])
    render json: student
  end
end
