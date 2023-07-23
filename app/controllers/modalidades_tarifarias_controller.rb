class ModalidadesTarifariasController < ApplicationController
  before_action :authenticate_user!
  def index
    @modalidades = ModalidadeTarifaria.all

    render json: @modalidades
  end
end
