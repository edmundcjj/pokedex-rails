class PokemonsController  < ApplicationController
  # Retrieve full list of pokemons
  def index
    @pokemons = Pokemon.all
  end

  # Retrieve details of a specific pokemon
  def show
    @pokemon = Pokemon.find(params[:id])
  end

  # Render the form to create new pokemon
  def new
    @pokemon = Pokemon.new
  end

  # Create a new pokemon and save it to the database
  def create
    @pokemon = Pokemon.new(create_pokemon_params)

    @pokemon.save!

    if @pokemon.save
      redirect_to @pokemon
    else
      render html: 'error!'
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])

    if @pokemon.update(edit_pokemon_params)
      redirect_to @pokemon
    else
      render html: 'error!'
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy!

    redirect_to pokemons_path
  end

  private

  # Set the parameters that are permissible to be saved into the database for creating a new pokemon
  def create_pokemon_params
    params.require(:pokemon).permit(:id, :num, :name, :img, :height, :weight, :candy, :candy_count, :egg, :avg_spawns, :spawn_time)
  end

  # Set the parameters that are permissible to be saved into the database for editing a existing pokemon
  def edit_pokemon_params
    params.require(:pokemon).permit(:name, :img, :height, :weight, :candy, :candy_count, :egg, :avg_spawns, :spawn_time)
  end
end
