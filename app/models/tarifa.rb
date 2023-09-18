class Tarifa < ApplicationRecord
  paginates_per 100
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

  scope :valorTarifaporDistribuidora, -> (){ ## 5º Questão
    select("NumCNPJDistribuidora, vlrtusd")
      .group("numcnpjdistribuidora, vlrtusd")
      .order("vlrtusd DESC")
  }

  scope :numTarifasPorPosto, -> {  ## 6º questão
    select("NomPostoTarifario, COUNT(idTarifas)")
      .group("NomPostoTarifario")
  }

  scope :unidadesConsumidoras, -> {
    select("dscclasse, dscsubClasse, SUM(CAST(REPLACE(VlrTe, ',', '.') AS DECIMAL(16,2))) AS TotalConsumo")
      .where("DatFimVigencia IS NOT NULL
              AND DatFimVigencia >= (DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '6 months')::DATE
              AND DatFimVigencia <= DATE_TRUNC('month', CURRENT_DATE)::DATE")
      .group("dscclasse, dscsubclasse")
      .order("TotalConsumo DESC")
      .limit(10)
  }

  scope :resolucoes, -> { ## 9º Questão
    select("DISTINCT DscResolucaoHomologatoria")
      .order("DscResolucaoHomologatoria")
  }

  scope :agentes_e_tarifas, -> {  ## 10º Questão
    select("SigAgente, COUNT(*) AS QuantidadeTarifas")
      .group("SigAgente")
      .order("QuantidadeTarifas DESC")
  }
end
