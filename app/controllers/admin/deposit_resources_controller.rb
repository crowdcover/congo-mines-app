# frozen_string_literal: true

class Admin::DepositResourcesController < Admin::Auth
  active_scaffold :deposit_resource do |config|
    config.columns.exclude(:created_at, :updated_at)

    config.columns = %i[deposit_type mineral_resource tonnage metal_content
                        metal_content_unit grade]

    config.columns[:deposit_type].form_ui = :hidden

    config.columns[:mineral_resource].form_ui = :select
    #    config.columns[:resource].options = {
    #      include_blank: 'Select Resource',
    #      options: ['gold', 'copper', 'cobal#t', 'zinc', 'silver', 'tin']}

    config.columns[:metal_content_unit].form_ui = :select
    config.columns[:metal_content_unit].options = {
      include_blank: 'Sélectionner l\'unité',
      options: %w[Kt Moz]
    }
  end
end
