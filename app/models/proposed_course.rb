# frozen_string_literal: true

# Class that represents a proposed course
class ProposedCourse
  attr_reader :id, :teacher_id, :course_id, :created_at, :updated_at

  def initialize(id:, teacher_id:, course_id:, created_at:, updated_at:, course: nil, teacher: nil) # rubocop:disable Metrics/ParameterLists
    @id = id
    @course_id = course_id
    @teacher_id = teacher_id
    @course = course
    @teacher = teacher
    @created_at = created_at
    @updated_at = updated_at
  end

  def course
    raise Errors::AssociationNotLoadedError if @course.nil?

    @course
  end

  def teacher
    raise Errors::AssociationNotLoadedError if @teacher.nil?

    @teacher
  end
end
