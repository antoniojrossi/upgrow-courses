# frozen_string_literal: true

# Create the proposed courses table in database
class CreateProposedCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :proposed_courses do |t|
      t.references :teacher, foreign_key: true, index: true
      t.references :course, foreign_key: true, index: true
      t.timestamps
    end
  end
end
