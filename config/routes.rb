# frozen_string_literal: true

Rails.application.routes.draw do
  resources :teachers do
    resources :courses, only: %i[create destroy]
  end
end
