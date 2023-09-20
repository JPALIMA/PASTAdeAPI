#app/controllers/grades_controller.rb
class GradesController < ApplicationController
  def index
    grades = Grade.all
    render json: grades
  end

  def create
    grade = Grade.new(grade_params)
    if grade.save
      render json: grade, status: :created
    else
      render json: grade.errors, status: :unprocessable_entity
    end
  end

  private

  def grande_params
    params.require(:grade).permit(:statudent_id, :subject, :value)
  end
end
