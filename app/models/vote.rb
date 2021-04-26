# frozen_string_literal: true

# Model Vote
class Vote
  attr_reader :teacher_id, :created_at, :updated_at

  def initialize(id:, teacher_id:, created_at:, updated_at:)
    @id = id
    @teacher_id = teacher_id
    @created_at = created_at
    @updated_at = updated_at
  end
end
