class Tarifa < ApplicationRecord
  scope :selecionar_datas_cnpj, ->(inicio, fim) { 
    select(:numcnpjdistribuidora, :datiniciovigencia, :datfimvigencia)
    .where("datiniciovigencia >= ? AND datfimvigencia <= ?", inicio, fim)
  }

  scope :descclasse, -> {
    select('distinct dscclasse') ## 3º Questão
  }

  scope :agregado_por_modalidade, -> { ## 4º Questão
    select("DatGeracaoConjuntoDados, DscModalidadeTarifaria, COUNT(*) AS quantidade_registros")
      .joins("JOIN modalidade_tarifaria mt ON mt.idModalidade_Tarifaria = DscModalidadeTarifaria")
      .group("DatGeracaoConjuntoDados, DscModalidadeTarifaria")
  }

  scope :valorTarifaporDistribuidora, -> (offset_value = 0){ ## 5º Questão
    select("NumCNPJDistribuidora, vlrtusd")
      .group("numcnpjdistribuidora, vlrtusd")
      .order("vlrtusd DESC")
      .limit(100)
      .offset(offset_value)
  }

  scope :numTarifasPorPosto, -> {  ## 6º questão
    select("NomPostoTarifario, COUNT(idTarifas)")
      .group("NomPostoTarifario")
  }

  scope :resolucoes, -> (offset_value = 0) {
    select("DISTINCT DscResolucaoHomologatoria")
      .order("DscResolucaoHomologatoria")
      .limit(100)
      .offset(offset_value)
  }

end
