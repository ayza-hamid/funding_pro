# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    end
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'user is successfully updated.'
    else
      render :edit, alert: 'Sorry! user is not created'
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :marital_status)
  end
end
