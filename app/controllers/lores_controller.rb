class LoresController < ApplicationController
  def index
    @graphic = "loreheaderbg2.png"
    @heading = "Lore"

    render layout: 'gallery'
  end
end