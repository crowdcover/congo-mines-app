class Admin::ProductionExportsController  < Admin::Auth #ApplicationController
  active_scaffold :"production_export" do |config|

  config.columns.exclude(:metal_content, :created_at, :updated_at)

  config.columns[:type_of_product].form_ui = :select
  config.columns[:type_of_product].options = {include_blank: 'Type de produit sélectionné',
    options: ['Concentré de cuivre','Concentré de cobalt','Concentré cuivro-cobaltifère',
              'Cuivre noire','Cathode de cuivre','Alliage blanc','Alliage rouge',
              'Cuivre mat','Poussière de zinc',
              'Poussière de plomb','Hétérogénite brut','Hydroxyde de cobalt',
              'Lingot or','Or brut','Wolframite brut','Coltan brut','Cassiterite brute']}

    config.columns[:year].form_ui = :select
    config.columns[:year].options = {include_blank: 'Sélectionnez l\'année', options: (2000..Time.now.year) }

  end
end
