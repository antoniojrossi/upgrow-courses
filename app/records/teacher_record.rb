# frozen_string_literal: true

# Persistence layer for teachers
class TeacherRecord < ApplicationRecord
  self.table_name = 'teachers'

  has_many :course_records, foreign_key: :teacher_id, dependent: :destroy
end
