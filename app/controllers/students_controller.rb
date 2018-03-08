class StudentsController < ApiController
  def show
    @student = Student.find(params[:id])
  end
end
