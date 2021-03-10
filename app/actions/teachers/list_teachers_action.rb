# frozen_string_literal: true

module Teachers
  # Get all teachers registered in the system
  class ListTeachersAction < Action
    result :teachers

    def perform
      teachers = TeacherRepository.new.all
      result.success(teachers: teachers)
    end
  end
end
