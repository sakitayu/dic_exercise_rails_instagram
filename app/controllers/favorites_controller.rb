class FavoritesController < ApplicationController
  def create
    user = current_user
    blog = Blog.find(params[:blog_id])
    if Favorite.create(user_id: user.id, blog_id:blog.id)
    redirect_to blog_path
    else
      redirect_to root_url
    end

  end

  def destroy
    user = current_user
    blog = Blog.find(params[:blog_id])
    if favorite = Favorite.find_by(user_id: user.id, blog_id:blog.id)
      favorite.delete
      redirect_to users_path(current_user)
    else
      redirect_to root_url
    end
  end
end
