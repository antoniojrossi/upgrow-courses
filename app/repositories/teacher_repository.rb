# frozen_string_literal: true

# Centralize all teacher record actions
class TeacherRepository
  include Modelizer

  def all
    TeacherRecord.all.map { |record| to_model(:teacher, record.attributes) }
  end

  def create(input)
    record = TeacherRecord.create!(name: input.name)
    to_model(:teacher, record.attributes)
  end

  def find(id)
    record = TeacherRecord.find(id)
    to_model(:teacher, record.attributes)
  end

  def find_with_courses(id)
    record = TeacherRecord.find(id)

    courses = record.course_records.map do |course_record|
      to_model(:course, course_record.attributes)
    end

    to_model(:teacher, record.attributes.merge(courses: courses))
  end

  def update(id, input)
    record = TeacherRecord.find(id)
    record.update!(name: input.name)
    to_model(:teacher, record.attributes)
  end

  def delete(id)
    record = TeacherRecord.find(id)
    record.destroy!
  end
end
