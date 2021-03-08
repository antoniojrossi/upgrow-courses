class ShowTeacherAction < Action
  result :teacher
  
  def perform(id)
    result.success(teacher: TeacherRepository.new.find(id))
  end
end