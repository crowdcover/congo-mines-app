class TranslateDataValues < ActiveRecord::Migration
  def up
    execute "UPDATE employees SET gender='mâle' where gender = 'male'" 
    execute "UPDATE employees SET gender='femelle' where gender = 'female'" 
    execute "UPDATE employees SET nationality='expatrié' where nationality = 'expatriot'" 
    execute "UPDATE flows_payable_under_contracts SET contract_cash_recipient='Autre' where contract_cash_recipient = 'Other'"
    execute "UPDATE env_and_social_obligations SET community_fund='oui' where community_fund = 'yes'"
    execute "UPDATE env_and_social_obligations SET community_fund='non' where community_fund = 'no'"
    execute "UPDATE env_and_social_obligations SET community_dialogue_platform='oui' where community_dialogue_platform = 'yes'"
    execute "UPDATE env_and_social_obligations SET community_dialogue_platform='non' where community_dialogue_platform = 'no'"
    execute "UPDATE employees SET gender='femelle' where gender = 'female'" 
    execute "UPDATE drc_companies SET project_phase='fermé' where project_phase = 'closed'"
    execute "UPDATE drc_companies SET project_type='Industriel' where project_type = 'Industrial (industriel)'"
    execute "UPDATE drc_companies SET project_type='Semi-industriel' where project_type = 'Semi-Industrial (semi-industriel)'"
    execute "UPDATE drc_companies SET project_type='Artisanal' where project_type = 'Artisanal (artisanal)'"
  end
end
