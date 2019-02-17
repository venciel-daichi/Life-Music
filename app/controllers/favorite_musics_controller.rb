class FavoriteMusicsController < ApplicationController

	def new
		@favorite_music = FavoriteMusic.new
	end
	def create
		favorite_music = FavoriteMusic.new(favorite_music_params)
		favorite_music.user_id = current_user.id
		favorite_music.save
		redirect_to musics_path
	end
	def edit
		@favorite_music = FavoriteMusic.find_by(id:1)
	end
	def update
		favorite_music = FavoriteMusic.find_by(id:1)
        favorite_music.update(favorite_music_params)
        redirect_to musics_path
	end

	private
    def favorite_music_params
        params.require(:favorite_music).permit(:music_name , :artist_name , :image , :introduction , :music_url , :user_id)
    end
end
