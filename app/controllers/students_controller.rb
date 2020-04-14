class StudentsController < ApplicationController
  def index
    @q = Student.ransack(params[:q])
    @departments = Department.all
    @students = @q.result.includes(:department, :subjects)
  end

  def search
    @q = Student.ransack(search_params)
    @students = @q.result.includes(:department, :subjects)
  end

  private
  def search_params
    params.require(:q).permit(:age_gteq)
  end
end
