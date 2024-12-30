class LoresController < ApplicationController
  def index
    @page_title = 'Sojourn Star'
    @graphic = "loreheaderbg2.png"
    @heading = "Lore"

    render layout: 'gallery'
  end
end