# frozen_string_literal: true

# Centralize all teacher record actions
class VoteRepository
  include Modelizer

  def create(input)
    record = VoteRecord.create!(
      teacher_id: input.voter_id,
      votable: "#{input.votable_type.singularize}_record".classify.constantize.find_by(id: input.votable_id)
    )
    to_model(:vote, record.attributes)
  rescue ActiveRecord::RecordInvalid => e
    raise Errors::VoteInvalid.new(e.message, e.record.errors)
  end
end
