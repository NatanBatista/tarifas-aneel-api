class SubgruposTarifariosController < ApplicationController
  def index
    @subgrupos = SubgrupoTarifario.all

    render json: @subgrupos
  end
end
