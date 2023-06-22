class Tarifa < ApplicationRecord
  scope :selecionar_datas_cnpj, ->(inicio, fim) { 
    select(:numcnpjdistribuidora, :datiniciovigencia, :datfimvigencia)
    .where("datiniciovigencia >= ? AND datfimvigencia <= ?", inicio, fim)
  }

end
