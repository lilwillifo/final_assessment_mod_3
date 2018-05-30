class ValidationController < ApplicationController
  def show
    @validation = Validation.new(validation_params['word'])
  end

  private

  def validation_params
    params.permit(:word)
  end
end
