# frozen_string_literal: true

# Persistence layer for proposed courses
class ProposedCourseRecord < ApplicationRecord
  self.table_name = 'proposed_courses'

  belongs_to :teacher_record, foreign_key: :teacher_id
  belongs_to :course_record, foreign_key: :course_id

  validates_uniqueness_of :teacher_id, scope: :course_id
end
