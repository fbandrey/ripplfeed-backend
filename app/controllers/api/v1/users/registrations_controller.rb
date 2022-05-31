class Api::V1::Users::RegistrationsController < Api::V1::BaseController

  skip_before_action :authorize!

  def create
    service = Services::Users::Create.new(create_params)
    if service.call
      render json: service.user, serializer: Users::SessionSerializer
    else
      render_errors service.user.errors_as_json
    end
  end

  private

  def create_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :nick_name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
