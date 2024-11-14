class CharactersController < ApplicationController
  def index
    @graphic = "sojourn_planet"
    @heading = "Characters"

    render layout: 'gallery'
  end
end