# frozen_string_literal: true

class VoteInput
  include ActiveModel::Model

  attr_accessor :voter_id, :votable_type, :votable_id

  validates_presence_of :voter_id, :votable_type, :votable_id
end
