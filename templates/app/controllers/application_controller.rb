class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:current]
  protect_from_forgery with: :exception, unless: :json_request?

  def current
    render json: current_user
  end

  private

  def json_request?
    request.format.json?
  end
end
