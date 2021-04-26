# frozen_string_literal: true

# Generates new model from its attributes
module Modelizer
  def to_model(model, attributes)
    model.to_s.classify.constantize.new(**attributes.symbolize_keys)
  end
end
