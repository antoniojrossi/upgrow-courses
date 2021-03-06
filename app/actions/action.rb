# frozen_string_literal: true

# Abstract class that represents an action in the architecture. All actions
# extend this class.
class Action
  class << self
    def result_class
      @result_class ||= Result.with_members(:empty)
    end

    protected

    def result(*args)
      @result_class = Result.with_members(*args)
    end
  end

  def result
    self.class.result_class
  end
end
