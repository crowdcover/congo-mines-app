class CreateEnvAndSocialObligations < ActiveRecord::Migration
  def change
    create_table :env_and_social_obligations do |t|
      t.references :congolese_company, index: true
      t.integer :year
      t.integer :number_of_direct_employees_expats
      t.integer :number_of_direct_employees_congolese
      t.integer :number_of_subcontractors_expats
      t.integer :number_of_subcontractors_congolese
      t.string :establishment
      t.boolean :of_community_funds
      t.string :dates_of_public_consultation_as_part_of_the_env_impact
      t.string :study_dates
      t.string :link_to_environmental_impact_study
      t.string :link_to_sustainable_dev_plan_and_or_community_agreement
      t.boolean :existence_of_a_platform_for_community_dialogue
      t.string :amount_invested_in
      t.integer :social_programmes
      

      t.timestamps
    end
  end
end
