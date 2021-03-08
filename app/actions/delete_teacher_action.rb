class DeleteTeacherAction < Action
  def perform(id)
    TeacherRepository.new.delete(id)
    result.success
  end
end