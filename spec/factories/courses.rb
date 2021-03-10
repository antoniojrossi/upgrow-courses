# frozen_string_literal: true

FactoryBot.define do
  factory :course, class: 'CourseRecord' do
    title { "How to paint like #{Faker::Artist.name}" }
  end
end
