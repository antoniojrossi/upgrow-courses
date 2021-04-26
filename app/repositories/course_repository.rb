# frozen_string_literal: true

# Centralize all actions made to courses records
class CourseRepository
  def create(input)
    record = CourseRecord.create!(title: input.title, teacher_id: input.teacher_id)
    to_model(record.attributes)
  rescue ActiveRecord::RecordInvalid => e
    raise Errors::CourseInvalid.new(e.message, e.record.errors)
  end

  def delete(id)
    record = CourseRecord.find(id)
    record.destroy!
  end

  def all
    CourseRecord.all.map { |record| to_model(record.attributes) }
  end

  private

  def to_model(attributes)
    Course.new(**attributes.symbolize_keys)
  end
end
