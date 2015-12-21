class UsersController < ApplicationController
require 'byebug'
  def index
    render json: User.all
  end

  def create
    # user = User.new(params[:user].permit(:name, :email))
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    success = @user.update(user_params)
    # redirect_to cat_url(@cat)
    if success
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy

    @user = User.find(params[:id])
    @user.destroy
    render json: @user
  end


  private

  def user_params
    params.require(:user).permit(:username)
  end

end
