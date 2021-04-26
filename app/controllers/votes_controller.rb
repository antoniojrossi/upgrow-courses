# frozen_string_literal: true

# Controller for voting
class VotesController < ApplicationController
  def create
    input = VoteInput.new(vote_params)

    Votes::VoteAction.new.perform(input)
                     .and_then { |vote| render json: vote.to_json }
                     .or_else { |errors| render json: errors.to_json }
  end

  private

  def vote_params
    votable_type, votable_id = request.path.split('/')[1, 2]
    # FIXME: Unpermitted parameters teacher_id, vote in console, fix
    params.permit(:voter_id).merge(votable_type: votable_type, votable_id: votable_id)
  end
end
