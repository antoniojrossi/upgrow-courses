# frozen_string_literal: true

# Controller for course actions
class CoursesController < ApplicationController
  def create
    input = CourseInput.new(course_params)
    input.teacher_id = params[:teacher_id]
    Courses::CreateCourseAction.new.perform(input)
                               .and_then { |course| render json: course.to_json, status: :created }
                               .or_else { |errors| render json: errors.to_json, status: :unprocessable_entity }
  end

  private

  def course_params
    params.permit(:title)
  end
end
