class CreateEnvAndSocialObligations < ActiveRecord::Migration
  def change
    create_table :env_and_social_obligations do |t|
      t.references :drc_company, index: true
      t.boolean :community_fund
      t.date    :enviro_impact_date
      t.string  :enviro_impact_link
      t.string  :sustainable_dev_plan
      t.boolean :community_dialogue_platform
      t.integer :social_investment
    end
  end
end     
