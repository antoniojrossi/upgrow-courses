# frozen_string_literal: true

# Create the courses table in database
class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.references :teacher, foreign_key: true, index: true

      t.timestamps
    end
  end
end
