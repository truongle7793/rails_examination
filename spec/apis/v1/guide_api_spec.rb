require 'rails_helper'

RSpec.describe 'Api::V1::GuideController', type: :request do
  describe 'GET /api/v1/guides' do
    context 'get all guides info' do
      before do
        create_list(:guide, 5)
        language = create(:language)
        activity = create(:activity)

        guide_ids = Guide.pluck(:id)
        guide_ids.sample(3).each do |guide_id|
          guide = Guide.find(guide_id)
          guide.languages = [language]
          guide.activities = [activity]
        end
        get '/api/v1/guides'
      end
      let(:expected_response) { GuideSerializer.new(Guide.all).serialized_json }
      it 'should ' do
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response.body).to eq(expected_response)
      end
    end
  end
end