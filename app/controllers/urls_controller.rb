# frozen_string_literal: true

# Url Controller
class UrlsController < ApplicationController
  before_action :set_url, only: :show

  def create
    @url = Url.new(url_params)
    if @url.save
      render :create, status: :created
    else
      render :error, status: :unprocessable_entity
    end
  end

  def show
    if @url&.available?
      redirect_to @url.url
    else
      render :show
    end
  end

  private

  def url_params
    params.require(:url).permit(:url)
  end

  def set_url
    @url = Url.find(params[:id])
  end
end
