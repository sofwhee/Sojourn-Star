class LoresController < ApplicationController
  def index
    @graphic = "loreheaderbg2"
    @heading = "Lore"

    render layout: 'gallery'
  end
end