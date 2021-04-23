# frozen_string_literal: true

# Centralize all actions made to proposed courses records
class ProposedCourseRepository
  def create(input)
    record = ProposedCourseRecord.create!(teacher_id: input.teacher_id, course_id: input.course_id)
    to_model(record.attributes)
  rescue ActiveRecord::RecordInvalid => e
    raise Errors::ProposedCourseInvalid.new(e.message, e.record.errors)
  end

  def all
    ProposedCourseRecord.all.map do |record|
      to_model(record.attributes)
    end
  end

  def all_with_course_and_teacher
    ProposedCourseRecord.includes(:course_record, :teacher_record).all.map do |record|
      course = to_course_model(record.course_record.attributes)
      teacher = to_teacher_model(record.teacher_record.attributes)
      to_model(record.attributes.merge(course: course, teacher: teacher))
    end
  end

  private

  # TODO: Refactorizar a una clase o modulo
  def to_model(attributes)
    ProposedCourse.new(**attributes.symbolize_keys)
  end

  def to_course_model(attributes)
    Course.new(**attributes.symbolize_keys)
  end

  def to_teacher_model(attributes)
    Teacher.new(**attributes.symbolize_keys)
  end
end
