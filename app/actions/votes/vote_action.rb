# frozen_string_literal: true

module Votes
  # A teacher vote for another teacher or course
  class VoteAction < Action
    result :vote

    def perform(input)
      if input.valid?
        # TODO: Try to use a "domain service" to do the voting
        vote = VoteRepository.new.create(input)
        result.success(vote: vote)
      else
        result.failure(input.errors)
      end
    rescue Errors::VoteInvalid => e
      result.failure(e.errors)
    end
  end
end
