class MoveDrcCompsThatAreReallyCategories < ActiveRecord::Migration
  def change
  
=begin

    It looks like some categories missed the scrape, and as a result are showing as companies.
    These should be added to the categories table and removed from the drc_companies table.
    For a complete list of categories, see site_categories.gdoc
    Example documents with miscategorized categories:
        http://188.166.93.154/reports/656
    I've gone through the companies table and found the following entries that should be categories:
=end

    cats_as_companies = [
        'Revisitation Des Contrats Miniers',
        'Budget',
        'Rétrocession',
        'Guides Et Manuels',
        'Lois, Normes Et Règlements',
        'Allocation Des Titres Miniers',
        'Aperçu Du Secteur Minier',
        'Emploi',
        'Exploitation Et Exportation',
        'Fiscalité Minière',
        'Histoire Du Secteur Minier',
        'Législation Minière',
        'Mines Et Environnement',
        'Secteur Artisanal',
        'Recettes Du Secteur Minier',
        'Gestion Des Entreprises étatiques',
        'Transparence Des Industries Extractives',
        'Géologie Et Exploration',
        'Mines, Communautés Locales Et Droits Humains',
        'Projets Minerais & Infrastructures',
        'Traçabilité',
        'Listes, Tableaux Et Statistiques', 
        'Contrats Et Avenants', # **(merge w/ Type de document: Contrats
        'Synthèses Et Résumés',
        'Statuts Et Actes De Constitution',
        "Documents D'entreprises Et Publications Boursières",
        'Revision Du Code Minier' ]


      cats_as_companies.each do |c|
        puts "...searching for #{c}"
        
        drc_companies = DrcCompany.where(name: c).all
    
        puts "puts DRC Company COUNT: #{drc_companies.count}"
              
        drc_company = drc_companies.first
        
        if drc_company
          puts "found: #{drc_company.name}"
          puts "Documents Attached:  #{drc_company.reports.count}"
          
          cat = Category.where(name: c)         
          puts "------------> Found Category #{c}" if cat
         
          reports = drc_company.reports
          
          drc_company.destroy 
          reports.each do |r|
            if r.categories.include?(cat)
              puts "Report already includes category #{c}" 
            else
              r.categories << cat 
            end
          end    
        else
          puts "No Company found"
        end  
        
       
      end
  
  
  
  
  
  
  
  end
end
