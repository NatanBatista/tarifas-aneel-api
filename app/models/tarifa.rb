class Tarifa < ApplicationRecord
  scope :selecionar_datas_cnpj, ->(inicio, fim) { 
    select(:numcnpjdistribuidora, :datiniciovigencia, :datfimvigencia)
    .where("datiniciovigencia >= ? AND datfimvigencia <= ?", inicio, fim)
  }

  scope :descclasse, -> {
    select('distinct dscclasse')
  }

  scope :agregado_por_modalidade, -> {
    select("DatGeracaoConjuntoDados, DscModalidadeTarifaria, COUNT(*) AS quantidade_registros")
      .joins("JOIN modalidade_tarifaria mt ON mt.idModalidade_Tarifaria = DscModalidadeTarifaria")
      .group("DatGeracaoConjuntoDados, DscModalidadeTarifaria")
  }

  scope :valorTarifaporDistribuidora, -> (offset_value = 0){
    select("NumCNPJDistribuidora, vlrtusd")
      .group("numcnpjdistribuidora, vlrtusd")
      .order("vlrtusd")
      .limit(100)
      .offset(offset_value)
  }

  scope :numTarifasPorPosto, -> {
    select("NomPostoTarifario, COUNT(idTarifas)")
      .group("NomPostoTarifario")
  }

end
