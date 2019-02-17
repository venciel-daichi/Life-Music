class UsersController < ApplicationController
	def top
	end

	def about
	end


	def index
		@user = current_user
		@musics = Music.where(user_id: @user.id).page(params[:page]).reverse_order
	end
	def show
		@user = User.find(params[:id])
		@musics = @user.musics.page(params[:page]).reverse_order
	end
	def edit
        @user = User.find(params[:id])
    end
    def update
        user = User.find(params[:id])
        user.update(user_params)
        redirect_to musics_path
    end

	private
    def user_params
        params.require(:user).permit(:name, :image, :introduction)
    end
end
