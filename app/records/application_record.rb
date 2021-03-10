# frozen_string_literal: true

# Abstract class for all records
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
