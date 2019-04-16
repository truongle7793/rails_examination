module Api
  module V1
    class GuidesController < ActionController::API

      def index
        cache_key = "#{Guide.maximum(:updated_at)}/get_all_guides"
        cache_options = { compress: true, expires_in: 2.hours, race_condition_ttl: 10 }
        result = Rails.cache.fetch(cache_key, cache_options) do
          GuideSerializer.new(Guide.all).serialized_json
        end
        render json: result, status: :ok
      end
    end
  end
end
