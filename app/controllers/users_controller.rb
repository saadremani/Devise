class UsersController < ApplicationController

before_action :authenticate_user!, only: [:show]
before_action :authenticate_guser, only: [:show]

	def index
		@users_array = User.all
	end

	def show
		@user = User.find(params[:id])
		@events_array = @user.events
	end

	def edit
		@user = User.new
	end

		
	def update
		post_params = params.require(:user).permit(:first_name, :last_name, :description)
		@user = User.find(params[:id])
		if @user.update(post_params) then
			redirect_to root_path
		else
			render 'edit'
		end	
	end
private

	def authenticate_guser
		if (current_user.id != params[:id].to_i) then
			flash[:danger] = "mauvais profil"
			redirect_to root_path
		end	
	end

	
end
