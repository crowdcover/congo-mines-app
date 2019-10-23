class TranslateMiningCodeValues < ActiveRecord::Migration
  def up
    execute "UPDATE drc_companies SET legal_regime='Code minier révisé' where legal_regime = 'Revised Mining Code'"
    execute "UPDATE drc_companies SET legal_regime='Code minier 2002' where legal_regime = 'Mining Code 2002'"
  end
end
