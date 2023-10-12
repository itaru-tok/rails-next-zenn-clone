# frozen_string_literal: true

module Api
  module V1
    # This controller provides a health check endpoint for the API.
    class HealthCheckController < ApplicationController
      def index
        render json: { message: "Success Health Check!" }, status: :ok
      end
    end
  end
end
