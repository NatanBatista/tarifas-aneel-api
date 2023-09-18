class TarifasController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    render json: {ProgamaçãoWeb: "Api das tarifas aneel"}
  end

  def data_vigencia_cnpj
    inicio = params[:inicio]
    fim = params[:fim]
    
    @data_vigencia = Tarifa.selecionar_datas_cnpj(inicio, fim).page(params[:page])
    total_pages = @data_vigencia.total_pages

    render json: {
      total_pages: total_pages,
      data_vigencia: @data_vigencia
    }
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
    @valorTarifaporDistribuidora = Tarifa.valorTarifaporDistribuidora.page(params[:page])
    total_pages = @valorTarifaporDistribuidora.total_pages

    render json: {
      total_pages: total_pages,
      valores: @valorTarifaporDistribuidora
    }
  end

  def get_numTarifasPorPosto
    @numTarifasPorPosto = Tarifa.numTarifasPorPosto

    render json: @numTarifasPorPosto
  end

  def get_unidadesConsumidoras
    @unidadesConsumidoras = Tarifa.unidadesConsumidoras

    render json: @unidadesConsumidoras
  end

  def get_resolucao
    @resolucoes = Tarifa.resolucoes.page(params[:page])
    total_pages = @resolucoes.total_pages

    render json: {
      total_pages: total_pages,
      resolucoes: @resolucoes
    }
  end

  def get_agentes_e_tarifas
    @agentes = Tarifa.agentes_e_tarifas.page(params[:page])
    total_pages = @agentes.total_pages

    render json: {
      total_pages: total_pages,
      agentes: @agentes
    }
  end
end
