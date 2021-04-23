# frozen_string_literal: true

Rails.application.routes.draw do
  resources :teachers do
    resources :courses, only: %i[create destroy]
  end
  resources :proposed_courses, only: %i[index create]
end
