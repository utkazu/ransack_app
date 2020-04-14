class StudentsController < ApplicationController
  def index
    @q = Student.ransack(params[:q])
    @departments = Department.all
    @subjects = Subject.all
    @students = @q.result.includes(:department, :subjects)
  end

  def search
    @q = Student.ransack(search_params)
    @students = @q.result.includes(:department, :subjects)
  end

  private
  def search_params
    params.require(:q).permit(:name_cont, :department_id_eq, :sex_eq, :age_gteq, subjects_id_in: [])
  end
end
