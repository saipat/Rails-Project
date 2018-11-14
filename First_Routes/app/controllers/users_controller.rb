class UsersController < ApplicationController

  def index
    users = User.all

    render json: users
  end

  def show
    user = User.find_by(id: params[:id])

    render json: user
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))

    if user.save
      render json: user
    else
      render json: user.error.full_messages, status: 422
    end
  end

  def update
    user = user.find(params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 418
    end
  end

  def destroy
    user = User.find(params[:id])

    user.destroy
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
