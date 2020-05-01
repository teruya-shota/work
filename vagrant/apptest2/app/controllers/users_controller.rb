class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @teruya = User.find(current_user.id)
  	@user_path = User.all.order(created_at: :desc)
    @book = Book.new
  end

  # マイページ
  def show
  	@user = User.find(params[:id])
    @teruya = User.find(current_user.id)
  end

  def edit
  	@user = User.find_by(params[:id])
    redirect_to user_path(current_user)
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(current_user_params)
      redirect_to @user, notice: "You have updated user information successfully"
    else
      render :edit
    end
  end

   private

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end

