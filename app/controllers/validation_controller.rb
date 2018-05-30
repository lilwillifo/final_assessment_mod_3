class ValidationController < ApplicationController
  def show
    validation = Validation.create(validation_params)
  end
end
