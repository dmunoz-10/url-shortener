# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'Url validation' do
    it 'must exist' do
      url = build(:url, url: nil)
      url.save
      expect(url.errors[:url]).to include("can't be blank")
    end

    it 'must be valid' do
      url = build(:url, url: 'invalid_url')
      url.save
      expect(url.errors[:url]).to include('is invalid')
    end
  end

  describe 'available? method' do
    let!(:url) { create(:url) }

    context 'when the url is available' do
      it 'must return true' do
        expect(url.available?).to eq(true)
      end
    end

    context 'when the url is unavailable' do
      it 'must return false' do
        url.created_at = Time.zone.now - 8.days
        url.save
        expect(url.available?).to eq(false)
      end
    end
  end
end
