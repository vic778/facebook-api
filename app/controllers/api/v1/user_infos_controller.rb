class Api::V1::UserInfosController < ApplicationController
    before_action :authorized
    before_action :set_user_info, only: [:update, :destroy]

    def index
        @user_infos = UserInfo.all
        render json: @user_infos
    end

    def show
        @user_info = UserInfo.find(params[:id])
        render json: @user_info
    end

    def create
        @user_info = UserInfo.create(user_info_params.merge(user: @user))
        if @user_info.save
            render json: { success: true, message: 'UserInfo created successfully' }, status: :created
        else
            render json: { success: false, message: @user_info.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        # @user_info = UserInfo.find(params[:id])
        if @user_info.update(user_info_params)
            render json: { success: true, message: 'UserInfo updated successfully' }, status: :ok
        else
            render json: { success: false, message: @user_info.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def set_user_info
        @user_info = @user.userInfos.find(params[:id])
    end

    def user_info_params
        params.permit(:bio, :city, :from, :profile_picture, :cover_picture, :relationship)
    end
end
