# frozen_string_literal: true

# General exception handler
module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::ParameterMissing do |e|
      render json: { message: "Parametter missing: #{e.param}" }, status: :unprocessable_entity
    end
  end
end
