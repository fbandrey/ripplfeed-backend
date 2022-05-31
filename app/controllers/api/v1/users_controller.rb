class Api::V1::UsersController < Api::V1::BaseController

  skip_before_action :authorize!, only: :index

  def index
    render json: User.all, each_serializer: Users::DashboardSerializer
  end

  def self
    render json: current_user, serializer: Users::SelfSerializer
  end

end
