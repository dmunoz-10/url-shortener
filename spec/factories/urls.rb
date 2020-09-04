# frozen_string_literal: true

FactoryBot.define do
  factory :url do
    url { FFaker::Internet.http_url }
  end
end
