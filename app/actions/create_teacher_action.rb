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