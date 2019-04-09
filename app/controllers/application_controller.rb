
require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

	 	 get '/recipes' do
	  	@recipes = Recipe.all
	  	#binding.pry
	  	erb :index
		 end
		 

		  get '/recipes/new' do 
		erb :new
		end


	  	
	  	 post '/recipes' do 
	  	 @recipe = Recipe.create(params)
	  	 #binding.pry
	  	 redirect to "/recipes/#{@recipe.id}"
		 end
		

	   

	  	get '/recipes/:id' do 
	  		#binding.pry
	    @recipe = Recipe.find_by_id(params[:id])
	    #binding.pry
	    erb :show
		end

		get '/recipes/:id/edit' do
				#binding.pry
		@recipe = Recipe.find_by_id(params[:id])
			#binding.pry
		erb :edit
		end
			
			patch '/recipes/:id' do
				
				#binding.pry
			@recipe = Recipe.find_by_id(params[:id])
			@recipe.name = params[:name]
			@recipe.ingredients = params[:ingredients]
			@recipe.cook_time = params[:cook_time]
			@recipe.save
			redirect to "/recipes/#{@recipe.id}"
			end

			delete '/recipes/:id' do
				
				@recipe = Recipe.find_by_id(params[:id])
				@recipe.delete

				redirect to '/recipes'

			end

			


		

end
