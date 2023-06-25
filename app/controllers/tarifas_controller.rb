class TarifasController < ApplicationController

  def index
    render json: {ProgamaçãoWeb: "Api das tarifas aneel"}
  end

  def data_vigencia_cnpj
    inicio = params[:inicio]
    fim = params[:fim]

    @data_vigencia = Tarifa.selecionar_datas_cnpj(inicio, fim)

    render json: @data_vigencia
  end

  def get_descclasse
    @classe = Tarifa.descclasse

    render json: @classe
  end

  def get_agregado_por_modalidade
    @agredado_modalidade_data = Tarifa.agregado_por_modalidade

    render json: @agredado_modalidade_data
  end
end
