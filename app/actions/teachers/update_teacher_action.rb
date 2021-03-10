# frozen_string_literal: true

module Teachers
  # Update a teacher info
  class UpdateTeacherAction < Action
    result :teacher

    def perform(id, input)
      if input.valid?
        teacher = TeacherRepository.new.update(id, input)
        result.success(teacher: teacher)
      else
        result.failure(input.errors)
      end
    end
  end
end
