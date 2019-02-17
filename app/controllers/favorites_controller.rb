class FavoritesController < ApplicationController
	def index
		@user = current_user
		@favorites = Favorite.where(user_id: current_user.id).page(params[:page])
	end
	def create
		music = Music.find(params[:music_id])
        favorite = current_user.favorites.new(music_id: music.id)
        favorite.save
        redirect_to musics_path
	end
	def destroy
		music = Music.find(params[:music_id])
        favorite = current_user.favorites.find_by(music_id: music.id)
        favorite.destroy
        redirect_to musics_path
	end
end
