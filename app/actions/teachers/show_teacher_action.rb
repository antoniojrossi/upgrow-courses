# frozen_string_literal: true

module Teachers
  # Get a teacher data
  class ShowTeacherAction < Action
    result :teacher

    def perform(id)
      result.success(teacher: TeacherRepository.new.find(id))
    end
  end
end
