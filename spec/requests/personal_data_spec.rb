# frozen_string_literal: true

require 'rails_helper'
require 'jwt'

RSpec.describe 'PersonalData', type: :request do
  let(:personal_data) { create :personal_data }

  describe 'POST /personal_data' do
    sign_in

    it 'description' do
      post '/personal_data', params: {
        personal_data: attributes_for(:personal_data)
      }

      expect(response).to have_http_status(:created)
    end
  end
end
