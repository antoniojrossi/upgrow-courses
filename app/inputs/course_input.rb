# frozen_string_literal: true

class CourseInput
  include ActiveModel::Model

  attr_accessor :title, :teacher_id

  validates :title, presence: true
  validates :teacher_id, presence: true
end
