class Api::V1::SessionsController < ApplicationController
  include CurrentUserConcern
  def create
    user = User.find_by(correo: params["user"]["correo"])
                .try(:authenticate, params["user"]["password"])

    if user
      session[:user_id] = user_id
      render json:
        status: :created,
        logged_in: true,
        user: user
        priv: user.privilegio_id
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end
end
