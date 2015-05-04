module ShareholdersHelper


=begin

  def options_for_association_conditions(association)
    if association.name == :shareholder_relationships
        {'congolese_companes_shareholders.shareholder_id' => @record.shareholder_id}
    else
      super
    end
  end
 

  def date_of_birth_search_column(record, html_options)
    selected = html_options.delete :value
           
    players = Player.select('distinct date_of_birth').except(:order).order('date_of_birth DESC').all
    select_options = players.collect do |player|
      [ l(player.date_of_birth), player.date_of_birth ]
    end
    options = { :selected => selected,
                    :include_blank => as_(:_select_)}
    select(:record, :date_of_birth, select_options, options, html_options)
  end

=end

 
end
