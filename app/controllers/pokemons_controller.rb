class PokemonsController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer_id = current_trainer.id
		@pokemon.save
		redirect_to :root

	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health -= 10
		@pokemon.save
		if @pokemon.health <= 0
			@pokemon.destroy
		end
		redirect_to "/trainers/" + @pokemon.trainer_id.to_s

	end

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new
		@pokemon.name = params[:pokemon][:name]
		@pokemon.health = 100
		@pokemon.level = 1
		@pokemon.trainer_id = current_trainer.id
		#@pokemon.trainer = current_trainer
		if @pokemon.save
			redirect_to "/trainers/" + @pokemon.trainer_id.to_s
		else
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to "/trainers/" + @pokemon.trainer_id.to_s
		end

	end

	#private
	#def pokemon_params
#		params.require(:pokemon).permit(:name)
	#end
end
