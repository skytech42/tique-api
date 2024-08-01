# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PersonalData, type: :request do
  let(:personal_data) { create :personal_data }

  describe 'POST /personal_data' do
    context "when attributes is valid" do
      sign_in
      it 'created response' do
        post '/personal_data', params: {
          personal_data: attributes_for(:personal_data)
        }

        expect(response).to have_http_status(:created)
      end
    end

    context "when attributes is invalid" do
      sign_in

      it "return unprocessable_entity error" do
        post '/personal_data', params: {
          personal_data: {
            email: "example"
            }
          }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when token auth is invalid" do
      it "return 401 error" do
        post '/personal_data', params: {
          personal_data: {
            email: "example"
            }
          }

        expect(response).to have_http_status(401)
      end
    end
  end
end
