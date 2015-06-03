class Admin::DepositsController <  Admin::Auth
  active_scaffold :"deposit" do |config|
      # Export
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"

    config.columns.exclude(:created_at, :updated_at)

    #config.columns = [:name, :drc_company_id, :mine_type, :permit_type, :permit_number, :source, :lat, :lng]

    #config.list.columns = [:name, :drc_company_id, :mine_type, :permit_type, :permit_number, :source, :lat, :lng,
  #    :proven_reserves, :probable_reserves, :proven_probable_reserves,
  #    :measured_resources, :indicated_resources, :inferred_resources, :total_resources]


    config.columns[:proven_reserves].allow_add_existing = false
    config.columns[:probable_reserves].allow_add_existing = false
    config.columns[:proven_probable_reserves].allow_add_existing = false
    config.columns[:measured_resources].allow_add_existing = false

    config.columns[:indicated_resources].allow_add_existing = false
    config.columns[:inferred_resources].allow_add_existing = false
    config.columns[:total_resources].allow_add_existing = false

    config.columns[:permit_type].form_ui = :chosen
    config.columns[:permit_type].options = {
      include_blank: 'Select Permit Type',
      options: [  'Permis de Recherche',
        'Permis d’Exploitation',
        'Permis d’exploitation des Rejets',
        'Permis d’Exploitation de Petit Mine']}
  end


  def attributes_hash_is_empty?(hash, klass)
    if klass == DepositResource
      #binding.pry
      #[:deposit_type, :mineral_resource, :tonnage, :metal_content, :metal_content_unit, :grade]

      super(hash.except(:deposit_type), klass)
    else
      super
    end
  end
end
