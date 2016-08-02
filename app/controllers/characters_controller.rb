class CharactersController < ApplicationController
	before_action :set_character, only: [:show, :destroy, :update, :edit]
	def index
		@characters = Character.all
	end

	def show
	end

	def edit
	end

	def new
		@character = Character.new
	end

	def create
		@character = Character.new(character_params)
		error "create"
	end

	def update
		@character.update(character_params)
		error "update"
	end

	def destroy
		character = Character.find(params[:id])
		character.destroy
		redirect_to "/characters", alert: "Character was successfully deleted."
	end

	private

	def character_params
		params.require(:character).permit(:name, :img_url, :house_id)
	end

	def set_character
		@character = Character.find(params[:id])
	end

	def error action
		if @character.save
			redirect_to @character, notice: "Character was successfully #{action}d."
		else
			message = "| "
			@character.errors.full_messages.each do |error|
				message << "#{error} | "
			end
			if action == "create"
				redirect_to new_character_path, alert: "#{ message }"
			elsif action == "update"
				redirect_to edit_character_path, alert: "#{ message } | Nothing has been changed"
			else
				redirect_to @character, alert: "#{ message }"
			end
		end
	end
end
