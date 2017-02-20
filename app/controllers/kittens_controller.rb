class KittensController < ApplicationController

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_attributes)
		if @kitten.save
			flash[:success] = "Kitten created!"
			redirect_to kitten_path(@kitten)
		else
			render 'new'
		end
	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def index
		@kittens = Kitten.all
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update_attributes(kitten_attributes)
			flash[:success] = "Kitten updated!"
			redirect_to kitten_path(@kitten)
		else
			render 'edit'
		end
	end

	def destroy
		@kitten = Kitten.find(params[:id])
		@kitten.delete
		flash[:success] = "Kitten deleted!"
		redirect_to root_path
	end

	private

	def kitten_attributes
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end
end
