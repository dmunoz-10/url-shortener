# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Urls', type: :request do
  describe 'POST #create' do
    context 'when params are ok' do
      it 'must render create template' do
        params = { url: attributes_for(:url) }
        post urls_path, params: params, xhr: true

        expect(response).to render_template(:create)
      end
    end

    context 'when params are wrong' do
      it 'must render error template' do
        params = { url: attributes_for(:url, url: 'invalid_url') }
        post urls_path, params: params, xhr: true

        expect(response).to render_template(:error)
      end
    end
  end

  describe 'GET #show' do
    context 'when url is available' do
      it 'must redirect to url' do
        url = create(:url)
        get show_url_path(url)

        expect(response).to redirect_to(url.url)
      end
    end

    context 'when url is unavailable' do
      it 'must render show template' do
        url = create(:url)
        url.update(created_at: Time.zone.now - 8.days)
        get show_url_path(url)

        expect(response).to render_template(:show)
      end
    end
  end
end
