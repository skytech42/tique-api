# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PersonalData', type: :request do
  describe 'GET /personal_data' do
    get personal_data_url

    expect(response).to have_http_status(:ok)
  end
end
