class Api::V1::RegistrationController < ApplicationController
  include CurrentUserConcern
  def create
    user = User.create!(
      nombre_completo: params['user']['nombre_completo'],
      correo: params['user']['correo'],
      telefono: params['user']['telefono'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation'],
      privilegio_id: params['user']["privilegio_id"]
    )

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      render json: { status: 500 }
    end
  end

end
