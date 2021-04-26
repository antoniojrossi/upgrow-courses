# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Courses API', type: :request do
  describe 'POST /courses' do
    let(:teacher) { create(:teacher) }
    let(:attributes) { { title: 'How to paint like Bob Ross', teacher_id: teacher.id } }

    before { post '/courses', params: attributes }

    context 'with valid attributes' do
      it 'returns status code 201 (created)' do
        expect(response).to have_http_status(:created)
      end

      it 'returns the correct course title' do
        expect(json_response['title']).to eq(attributes[:title])
      end
    end

    context 'with title already in use' do
      let(:teacher) { create(:teacher) }
      let(:course) { create(:course) }
      let(:attributes) { { title: course.title, teacher_id: teacher.id } }

      it 'returns status code 422 (unprocessable entity)' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'return info about the error' do
        expect(json_response['title']).to include(match(/has already been taken/))
      end
    end

    context 'with no title' do
      let(:attributes) { {} }

      it 'returns status code 422 (unprocessable entity)' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'return info about the error' do
        expect(json_response['title']).to include(match(/can't be blank/))
      end
    end
  end
end
