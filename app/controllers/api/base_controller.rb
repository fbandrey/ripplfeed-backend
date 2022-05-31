class Api::BaseController < ApplicationController
  class UserNotAuthorized < StandardError; end

  before_action :authorize!

  rescue_from 'UserNotAuthorized' do |exception|
    head 401
  end

  protected

  def current_user
    @current_user ||= begin
      return nil unless auth_token
      payload = Services::JWT.decode(auth_token)
      User.find_by(id: payload['id'], email: payload['email'])
    rescue
      nil
    end
  end

  private

  def authorize!
    raise UserNotAuthorized unless current_user
  end

  def auth_token
    request.headers['Authorization'].presence
  end

  def render_errors(array)
    render json: { errors: array }, status: 422
  end

end
