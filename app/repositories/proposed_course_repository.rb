# frozen_string_literal: true

# Centralize all actions made to proposed courses records
class ProposedCourseRepository
  include Modelizer

  def create(input)
    record = ProposedCourseRecord.create!(teacher_id: input.teacher_id, course_id: input.course_id)
    to_model(:proposed_course, record.attributes)
  rescue ActiveRecord::RecordInvalid => e
    raise Errors::ProposedCourseInvalid.new(e.message, e.record.errors)
  end

  def all
    ProposedCourseRecord.all.map do |record|
      to_model(:proposed_course, record.attributes)
    end
  end

  def all_with_course_and_teacher
    ProposedCourseRecord.includes(:course_record, :teacher_record).all.map do |record|
      course = to_model(:course, record.course_record.attributes)
      teacher = to_model(:teacher, record.teacher_record.attributes)
      to_model(:proposed_course, record.attributes.merge(course: course, teacher: teacher))
    end
  end
end
