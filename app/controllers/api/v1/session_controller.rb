class Api::V1::SessionController < ApplicationController

    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {success: true, message: 'User logged in successfully', user: @user, token: token}, status: :ok
        else
            render json: { success: false, message: 'Invalid username or password' }, status: :unauthorized
        end
    end
end
