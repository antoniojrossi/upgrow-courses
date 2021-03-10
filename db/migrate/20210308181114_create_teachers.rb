# frozen_string_literal: true

# Create the teachers table in database
class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :name

      t.timestamps
    end
  end
end
