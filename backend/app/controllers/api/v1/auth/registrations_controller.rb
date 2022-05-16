class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
    private
    def sign_up_params
        params.permit(:name, :emotion, :email, :password, :password_confirmation)
    end
end