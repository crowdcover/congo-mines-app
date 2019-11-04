class TranslationFixes < ActiveRecord::Migration
  def up
    execute "UPDATE employees SET gender='Masculin' where gender = 'mâle'"
    execute "UPDATE employees SET gender='Féminin' where gender = 'femelle'"
  end
end
