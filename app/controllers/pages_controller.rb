# frozen_string_literal: true

# Pages Controller
class PagesController < ApplicationController
  def home
    @url = Url.new
  end
end
