# frozen_string_literal: true

FactoryBot.define do
  factory :teacher, class: 'TeacherRecord' do
    name { Faker::Name.name }
  end
end
