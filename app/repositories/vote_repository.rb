# frozen_string_literal: true

# Centralize all teacher record actions
class VoteRepository
  def create(input)
    record = VoteRecord.create!(
      teacher_id: input.voter_id,
      votable: "#{input.votable_type.singularize}_record".classify.constantize.find_by(id: input.votable_id)
    )
    to_model(record.attributes)
  rescue ActiveRecord::RecordInvalid => e
    raise Errors::VoteInvalid.new(e.message, e.record.errors)
  end

  private

  def to_model(attributes)
    # TODO: Add "vote destination" or votable object to new vote
    Vote.new(**attributes.symbolize_keys.except(:votable_type, :votable_id))
  end
end
