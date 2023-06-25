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
end
