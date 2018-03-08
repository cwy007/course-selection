class TeachersController < ApiController
  def index
    @teachers = Teacher.all
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
  end
end
