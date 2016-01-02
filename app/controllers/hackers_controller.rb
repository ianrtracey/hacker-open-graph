class HackersController < ApplicationController

	def index
	end

	def show
	  @hacker = Hacker.find(params[:id])
	end

	def favorite
	 	type = params[:type]
	 	@hacker = Hacker.find(params[:id])
	 	if type == "favorite"
	 		current_user.favorites << @hacker
	 		redirect_to :back, success: "You favorited #{@hacker.first_name} #{@hacker.last_name}"
	 	elsif type = "unfavorite"
	 		current_user.favorites.delete(@hacker)
	 		redirect_to :back, notice: "#{@hacker.first_name} #{@hacker.last_name} unfavorited"
	 	else
	 		redirect_to :back, error: "Something went wrong"
	 	end
	end

	def favorites
		@favorites = current_user.favorites
	end
end
