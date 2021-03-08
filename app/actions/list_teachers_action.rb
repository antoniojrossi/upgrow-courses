class ListTeachersAction < Action
  result :teachers

  def perform
    teachers = TeacherRepository.new.all
    result.success(teachers: teachers)
  end
end