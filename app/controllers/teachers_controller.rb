class TeachersController < ApplicationController
  # GET /teachers
  def index
    teachers = ListTeachersAction.new.perform.teachers
    render json: teachers
  end

  # GET /teachers/1
  def show
    teacher = ShowTeacherAction.new.perform(params[:id]).teacher
    render json: teacher
  end

  # POST /teachers
  def create
    input = TeacherInput.new(teacher_params)

    CreateTeacherAction.new.perform(input)
      .and_then do |teacher|
        render json: teacher.to_json
      end
      .or_else do |errors|
        render json: errors.to_json
      end
  end

  # PUT /teachers/1
  def update
    input = TeacherInput.new(teacher_params)

    UpdateTeacherAction.new.perform(params[:id], input)
      .and_then do |teacher|
        render json: teacher.to_json
      end
      .or_else do |errors|
        render json: errors.to_json
      end
  end

  # DELETE /teachers/1
  def destroy
    DeleteTeacherAction.new.perform(params[:id])
    head :no_content
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
