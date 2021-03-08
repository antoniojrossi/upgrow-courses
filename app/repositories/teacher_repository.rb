class TeacherRepository
  def all
    TeacherRecord.all.map { |record| to_model(record.attributes) }
  end

  def create(input)
    record = TeacherRecord.create!(name: input.name)
    to_model(record.attributes)
  end

  def find(id)
    record = TeacherRecord.find(id)
    to_model(record.attributes)
  end

  def update(id, input)
    record = TeacherRecord.find(id)
    record.update!(name: input.name)
    to_model(record.attributes)
  end

  def delete(id)
    record = TeacherRecord.find(id)
    record.destroy!
  end

  private
  
  def to_model(attributes)
    Teacher.new(**attributes.symbolize_keys)
  end
end