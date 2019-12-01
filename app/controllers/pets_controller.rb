class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    erb :'/pets/new'
  end

  post '/pets' do 

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    
    if !params[:owner].keys.include?("pet_ids")
    params[:owner]["pet_ids"] = []
    end
    #######
 
    @owner = Owner.find(params[:id])
    @owner.update(params["owner"])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect "owners/#{@owner.id}"
end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end