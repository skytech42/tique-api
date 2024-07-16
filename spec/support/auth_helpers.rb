# frozen_string_literal: true

module Requests
  module AuthHelpers
    module Extensions
      def sign_in
        let(:auth_helpers_auth_token) do
          json_data(filename: 'auth_helpers_auth_token')
        end

        mock_auth_jwt_response
        mock_jwt_request
      end

      private

      def mock_auth_jwt_response
        let(:jwks_raw) do
          json_data(filename: 'jwks_raw').to_json
        end
        let(:jwks_response) { Net::HTTPSuccess.new(1.0, '200', body: jwks_raw) }
      end

      def mock_jwt_request
        before do
          allow(Net::HTTP).to receive(:get_response).and_return(jwks_response)
          allow(jwks_response).to receive(:body).and_return(jwks_raw)
        end
      end
    end

    module Includables
      HTTP_HELPERS_TO_OVERRIDE = %i[get post patch put delete].freeze
      # Override helpers for Rails 5.0
      # see http://api.rubyonrails.org/v5.0/classes/ActionDispatch/
      # Integration/RequestHelpers.html
      HTTP_HELPERS_TO_OVERRIDE.each do |helper|
        define_method(helper) do |path, **args|
          add_auth_headers(args)
          args == {} ? super(path) : super(path, **args)
        end
      end

      private

      def add_auth_headers(args)
        return unless defined? auth_helpers_auth_token

        args[:headers] ||= {}
        args[:headers].merge!(auth_helpers_auth_token)
      end
    end
  end
end
