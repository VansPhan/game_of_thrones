class TraitsController < ApplicationController
	before_action :set_character, only: [:index, :show, :destroy, :update, :edit]
	def index
		@traits = @character.traits
	end
	def show
		@traits = Trait.find(params[:id])
	end

	def edit
	end

	def new
		@character = Character.find(params[:character_id])
		@trait = @character.traits.build
	end

	def create
		@character = Character.find(params[:character_id])
		@trait = @character.traits.new(trait_params)
		error "create"
	end

	def update
		@trait.update(trait_params)
		error "update"
	end

	def destroy
		@trait = @character.traits.find(params[:id])
		@trait.destroy
		redirect_to character_traits_path, alert: "Trait was successfully deleted."
	end

	private

	def trait_params
		params.require(:trait).permit(:description)
	end

	def set_character
		@character = Character.find(params[:character_id])
	end

	def error action
		if @trait.save
			redirect_to character_trait_path(@character, @trait), notice: "Trait was successfully #{action}d."
		else
			message = "| "
			@trait.errors.full_messages.each do |error|
				message << "#{error} | "
			end
			if action == "create"
				redirect_to new_character_trait_path, alert: "#{ message }"
			elsif action == "update"
				redirect_to edit_character_trait_path, alert: "#{ message } | Nothing has been changed"
			else
				redirect_to @trait, alert: "#{ message }"
			end
		end
	end
end
