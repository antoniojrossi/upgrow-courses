# frozen_string_literal: true

Rails.application.routes.draw do
  concern :votable do
    resources :votes, only: [:create]
  end

  resources :teachers, concerns: :votable
  resources :courses, concerns: :votable, only: %i[index create delete]
  resources :proposed_courses, only: %i[index create], concerns: :votable
end
