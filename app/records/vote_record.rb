# frozen_string_literal: true

# Persistence layer for votes
class VoteRecord < ApplicationRecord
  self.table_name = 'votes'

  belongs_to :teacher, class_name: 'TeacherRecord'
  belongs_to :votable, polymorphic: true

  validates_uniqueness_of :teacher, scope: %i[votable_id votable_type]
end
