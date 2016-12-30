class PicsController < ApplicationController
	before_action :find_pic, only: [:edit, :show, :update, :destroy] 

	def index
		@pics = Pic.all.order("created_at DESC").where(user_id: current_user)
	end

	def new
		@pic = current_user.pics.build
	end

	def create
		@pic = current_user.pics.build(pic_params)

		if @pic.save
			redirect_to @pic, notice: "Yesssss! Its was Posted"
		else
			render "new"
		end
	end

	def edit

	end

	def update
		if @pic.update(pic_params)
			redirect_to @pic, notice: "Congrats! Pic was Updated!"
		else
			render "edit"
		end
	end

	def destroy
		if @pic.destroy
			redirect_to root_path
		end
	end

	private

	def pic_params
		params.require(:pic).permit(:title, :description, :image)
	end

	def find_pic
		@pic = Pic.find(params[:id])
	end
end
