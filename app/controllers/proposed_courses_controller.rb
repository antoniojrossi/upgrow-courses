# frozen_string_literal: true

# Controller for all actions available for proposed courses
class ProposedCoursesController < ApplicationController
  # GET /proposed_courses
  def index
    proposed_courses = ProposedCourses::ListProposedCoursesAction.new.perform.proposed_courses
    render json: proposed_courses
  end

  # POST /proposed_courses
  def create
    input = ProposedCourseInput.new(proposed_course_params)

    ProposedCourses::CreateProposedCourseAction.new.perform(input)
                                               .and_then { |proposed_course| render json: proposed_course.to_json }
                                               .or_else { |errors| render json: errors.to_json }
  end

  private

  def proposed_course_params
    params.require(:proposed_course).permit(:teacher_id, :course_id)
  end
end
