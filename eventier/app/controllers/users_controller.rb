class UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).per(20).reverse_order
  end

  def search
    @users = User.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.page(params[:page]).per(16).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
