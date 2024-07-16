# frozen_string_literal: true

# personal data controller
class PersonalDataController < ApiController
  before_action :authorize

  def index
    render json: { example: :ok }
  end

  def create
    personal_data = PersonalData.new personal_data_params

    if personal_data.save
      render json: personal_data, status: :created
    else
      render json: { errors: personal_data.errors.full_messages }, status: 422

    end
  end

  private

  def personal_data_params
    params.require(:personal_data).permit(
      :identifier_type,
      :name,
      :last_name,
      :identifier_number,
      :email
    )
  end
end
