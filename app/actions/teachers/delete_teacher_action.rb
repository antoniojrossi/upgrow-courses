# frozen_string_literal: true

module Teachers
  # Deletes a teacher from the system
  class DeleteTeacherAction < Action
    def perform(id)
      TeacherRepository.new.delete(id)
      result.success
    end
  end
end
