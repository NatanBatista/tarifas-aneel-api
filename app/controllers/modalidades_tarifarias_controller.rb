class ModalidadesTarifariasController < ApplicationController
  def index
    @modalidades = ModalidadeTarifaria.all

    render json: @modalidades
  end
end
