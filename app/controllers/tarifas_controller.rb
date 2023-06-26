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

  def get_valorTarifaporDistribuidora
    offset_value = params[:offset].to_i
    @valorTarifaporDistribuidora = Tarifa.valorTarifaporDistribuidora(offset_value)

    render json: @valorTarifaporDistribuidora
  end

  def get_numTarifasPorPosto
    @numTarifasPorPosto = Tarifa.numTarifasPorPosto

    render json: @numTarifasPorPosto
  end

  def get_resolucao
    offset_value = params[:offset].to_i
    @resolucoes = Tarifa.resolucoes(offset_value)

    render json: @resolucoes
  end
end
