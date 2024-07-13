# frozen_string_literal: true

# personal data controller
class PersonalDataController < ApiController
  before_action :authorize

  def index
    render json: { example: :ok }
  end
end
