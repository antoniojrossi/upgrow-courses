# frozen_string_literal: true

bob_ross = TeacherRepository.new.create(TeacherInput.new(name: 'Bob Ross'))
CourseRepository.new.create(CourseInput.new(title: 'How to paint a happy little tree', teacher_id: bob_ross.id))
