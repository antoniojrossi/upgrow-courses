# frozen_string_literal: true

class ProposedCourseInput
  include ActiveModel::Model

  attr_accessor :teacher_id, :course_id

  validates_presence_of :teacher_id, :course_id
end
