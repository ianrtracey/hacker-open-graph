class HackersController < ApplicationController

	before_filter :authenticate_user!


	def index
	end

	def show
	  @hacker = Hacker.find(params[:id])
	  @pdf = ""
	end

	def favorite
	 	type = params[:type]
	 	@hacker = Hacker.find(params[:id])
	 	if type == "favorite"
	 		current_user.favorites << @hacker
	 		redirect_to :back, notice: "You favorited #{@hacker.first_name} #{@hacker.last_name}"
	 	elsif type = "unfavorite"
	 		current_user.favorites.delete(@hacker)
	 		redirect_to :back, notice: "#{@hacker.first_name} #{@hacker.last_name} unfavorited"
	 	else
	 		redirect_to :back, notice: "Something went wrong"
	 	end
	end

	def favorites
		@favorites = current_user.favorites
	end
end
