class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
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

  #お気に入り投稿一覧取得
  def likes
    @user = User.find(params[:id])
    @favorites = Favorite.all
    # @favposts = @user.favposts.page(params[:page])
    # counts(@user)
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image, :image_cache )
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to "/"
    end
  end
end
