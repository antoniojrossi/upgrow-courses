# frozen_string_literal: true

module Teachers
  # Create a new teacher in the system
  class CreateTeacherAction < Action
    result :teacher

    def perform(input)
      if input.valid?
        teacher = TeacherRepository.new.create(input)
        result.success(teacher: teacher)
      else
        result.failure(input.errors)
      end
    end
  end
end
