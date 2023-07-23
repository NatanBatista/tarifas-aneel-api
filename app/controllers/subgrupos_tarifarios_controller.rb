class SubgruposTarifariosController < ApplicationController
  before_action :authenticate_user!
  def index
    @subgrupos = SubgrupoTarifario.all

    render json: @subgrupos
  end
end
