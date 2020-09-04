# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_found
    render 'urls/show'
  end
end
