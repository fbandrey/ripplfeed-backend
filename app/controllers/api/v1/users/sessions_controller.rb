class Api::V1::Users::SessionsController < Api::V1::BaseController

  skip_before_action :authorize!

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      render json: user, serializer: Users::SessionSerializer
    else
      render_errors errors
    end
  end

  private

  def errors
    {
      keys: [:email],
      messages: ['The email address or password you provided is incorrect, please try again.']
    }
  end

end
