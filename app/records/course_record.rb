# frozen_string_literal: true

# Persistence layer for courses
class CourseRecord < ApplicationRecord
  self.table_name = 'courses'

  validates_uniqueness_of :title
end
