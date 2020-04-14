class StudentsController < ApplicationController
  def index
    @q = Student.ransack(params[:q])
    @students = @q.result.includes(:department, :subjects)
  end

  def search
    @q = Student.serch(search_params)
    @students = @q.result.includes(:department, :subjects)
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
