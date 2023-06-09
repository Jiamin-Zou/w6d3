require 'byebug'

class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        # debugger
        @user = User.new(user_params)
        # debugger
        if @user.save
          render json: @user
        else
            
          render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
      # debugger
      @user = User.find(params[:id])

      render json: @user
    end

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        # redirect_to user_url(@user)
        render json:@user
      else
        render json:@user.errors.full_messages, status: 422
      end
    end

    def destroy
      @user = User.find(params[:id])

      if @user.destroy
        render json: User.all
      else
        render json:@user.errors.full_messages, status: 422
      end
    end

    private

    def user_params
      params.require(:user).permit(:username)
    end

end