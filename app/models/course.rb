# frozen_string_literal: true

# Class that represents a course
class Course
  attr_reader :id, :title, :teacher_id, :created_at, :updated_at

  def initialize(id:, title:, teacher_id:, created_at:, updated_at:)
    @id = id
    @title = title
    @teacher_id = teacher_id
    @created_at = created_at
    @updated_at = updated_at
  end
end
