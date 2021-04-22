# frozen_string_literal: true

# Controller for all actions available for
class TeachersController < ApplicationController
  # GET /teachers
  def index
    teachers = Teachers::ListTeachersAction.new.perform.teachers
    render json: teachers
  end

  # GET /teachers/1
  def show
    teacher = Teachers::ShowTeacherAction.new.perform(params[:id]).teacher
    render json: teacher
  end

  # POST /teachers
  def create
    input = TeacherInput.new(teacher_params)

    Teachers::CreateTeacherAction.new.perform(input)
                                 .and_then { |teacher| render json: teacher.to_json }
                                 .or_else { |errors| render json: errors.to_json }
  end

  # PUT /teachers/1
  def update
    input = TeacherInput.new(teacher_params)

    Teachers::UpdateTeacherAction.new.perform(params[:id], input)
                                 .and_then { |teacher| render json: teacher.to_json }
                                 .or_else { |errors| render json: errors.to_json }
  end

  # DELETE /teachers/1
  def destroy
    Teachers::DeleteTeacherAction.new.perform(params[:id])
    head :no_content
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
