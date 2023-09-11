class FavoritesController < ApplicationController
    def create
      favorite = current_user.favorites.create(kid_id: params[:kid_id])
      redirect_back(fallback_location: root_path)
    end
    def destroy
      favorite = Favorite.find_by(kid_id: params[:kid_id], user_id: current_user.id)
      favorite.destroy if favorite
      redirect_back(fallback_location: root_path)
    end
end