# frozen_string_literal: true

# Url Model
class Url < ApplicationRecord
  include Hashid::Rails

  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }

  def available?
    Time.zone.today - 7 <= Date.parse(created_at.localtime.to_s, '%d-%m-%Y')
  end
end
