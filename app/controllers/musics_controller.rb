class MusicsController < ApplicationController

	def show
	end
	def index
		@musics = Music.page(params[:page]).reverse_order
		@user = current_user
	end
	def new
		@music = Music.new
	end
	def create
		music = Music.new(music_params)
		music.user_id = current_user.id
		music.save
		redirect_to musics_path
	end
	def edit
		@music = Music.find(params[:id])
	end
	def update
        music = Music.find(params[:id])
        music.update(music_params)
        redirect_to musics_path
    end
	private
    def music_params
        params.require(:music).permit(:music_name , :artist_name , :image , :introduction , :music_url , :user_id)
    end
end
