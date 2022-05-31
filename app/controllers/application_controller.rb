class ApplicationController < ActionController::API

  def index
    render json: { welcome: 'How are you doing?' }
  end

end
