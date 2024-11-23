class LoresController < ApplicationController
  def index
    @graphic = "sojourn_planet"
    @heading = "Lore"

    render layout: 'gallery'
  end
end