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