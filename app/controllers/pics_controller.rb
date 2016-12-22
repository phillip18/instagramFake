class PicsController < ApplicationController
	#before_action :find_params, only: [:index, :new,] 

	def index
		
	end

	def new
		@pic = Pic.new
	end

	def create
		@pic = Pic.new(pic_params)
	end

	private

	def pic_params
		params.require(:pic).permit(:title, :description)
	end

	def find_params
		@pic = Pic.find(pic_params[:id])
	end
end
