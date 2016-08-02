class HousesController < ApplicationController
	before_action :set_character, only: [:show, :destroy, :update, :edit]
	def index
		@houses = House.all
	end
	def show
	end

	def edit
	end

	def new
		@house = House.new
	end

	def create
		@house = House.new(house_params)
		error "create"
	end

	def update
		@house.update(house_params)
		error "update"
	end

	def destroy
		house = House.find(params[:id])
		house.destroy
		redirect_to "/houses", alert: "House was successfully deleted."
	end

	private

	def house_params
		params.require(:house).permit(:name)
	end

	def set_character
		@house = House.find(params[:id])
	end

	def error action
		if @house.save
			redirect_to @house, notice: "House was successfully #{action}d."
		else
			message = "| "
			@house.errors.full_messages.each do |error|
				message << "#{error} | "
			end
			if action == "create"
				redirect_to new_house_path, alert: "#{ message }"
			elsif action == "update"
				redirect_to edit_house_path, alert: "#{ message } | Nothing has been changed"
			else
				redirect_to @house, alert: "#{ message }"
			end
		end
	end
end
