# frozen_string_literal: true

class TeacherInput
  include ActiveModel::Model

  attr_accessor :name

  validates :name, presence: true
end
