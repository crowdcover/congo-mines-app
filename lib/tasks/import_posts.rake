namespace :import do

  desc "get_pdfs from the Carter Center for the new website and store them on local filesystem"
    task :fetch_pdfs => :environment do
      require 'rubygems'
      require 'nokogiri'
      require 'open-uri'
      # Get a Nokogiri::HTML::Document for the page we’re interested in...
      #require 'mechanize'
      
      pdf_url = 'http://www.congomines.org/fr/moore-stephens-rapport-de-conciliation-itie-rdc-2012/'
      
      # mutiple pdf
      pdf_url = 'http://www.congomines.org/fr/statistiques-des-exportations-et-des-redevances-katanga-2013/'

      doc = Nokogiri::HTML(open(pdf_url))
      
      organization = doc.at_css(".entry-meta").text.match(/Organization:(.*)/)[1]
      organization.strip!
      puts organization
      # org = author	

      entry_title = doc.at_css(".entry-title").text
      puts entry_title
      
      entry_content = doc.at_css(".entry-content").text
      puts entry_content
      
      entry_date = doc.at_css(".article-date").text.match(/Date de publication: (.*)/)[1]
      entry_date.strip!
      puts entry_date
   
      puts "Fetching PDFs:"
      doc.css(".article-download a").each do |pdf|
        pdf_link =  pdf['href']
        pdf_name =  pdf.content
        puts pdf_link 
        puts pdf_name
      end
        
      doc.css(".cat-links a").each do |c|
        #puts c.text
      end
   end     

  desc "Import posts from Pipe Delimited File"
  task import_posts: :environment do
    f = []
    File.open("#{Rails.root}/db/products_20150217155543.pipe").each_line.with_index do |l, line_num|
    
      puts "BEFORE: #{l}"
      v = l.split('|')
      #puts "-" * 30
      #puts "AFTER: #{v}"
     
     
      if line_num == 0
        puts v.join(":string ")
        #puts v.join(",:")
        #exit
        v.pop
        f = v
      else
        h = {}
        f.each_with_index do |field, i|
          h[field.to_sym] = v[i]    
        end  
        #pp h
        Post.create(h)
      end      
    end
  end 
  
  
  
  # congo_site_ID|post_title|post_content|post_excerpt|category|post_tag|post_author|post_status|comment_status|permis_contrats|apercu_contact|organization|_edit_last|author|_edit_lock|doc_year|language|doc_month|doc_day|link|structure|gisements|production_exportation|recettes|_oembed_f30561fb916b7fd8b19930dd919f0e2d
 

  desc "Import posts from mysql out fle"
  task import_wp_posts: :environment do
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    require 'uri'

    
    # Create a few regex's in a hash to compare the categories to
    
    cats = {}
    Category.roots.each do |r|
      child_pipe = r.children.pluck(:name).map{|n|'\b' + n.downcase + '\b'}.join('|') 
      cats[r] = /#{child_pipe}/io 
    end
    
    File.open("#{Rails.root}/db/congomines.txt").each_line do |l|
    
      puts '*' * 40
     id, post_name, congo_url, date = l.split('|')
     #7824|huachin-mining-declaration-des-paiements-2012-a-ltie|http://www.congomines.org/fr/?p=7824|2015-03-27 10:07:58
     
      
      puts "--- FROM DB DUMP ---"
      puts post_name
      puts date
      congomines_url = "http://www.congomines.org/fr/#{post_name}"   
      puts congomines_url
      puts "---------"
      
      #post = Post.find_by_congo_site_ID(j['id'])
      #post_date = Date.parse("#{post.doc_month}-#{post.doc_day}-#{post.doc_year}")

      begin
        doc = Nokogiri::HTML(open(congomines_url))
      rescue
        next
      end
      
      organization = doc.at_css(".entry-meta").text.match(/Organization:(.*)/)[1] rescue nil
      
       unless organization.blank?
        organization.strip!
        puts "Organization: " + organization
       end	

      entry_title = doc.at_css(".entry-title").text
      puts "Title: " + entry_title
      
      entry_content = doc.at_css(".entry-content").text
      puts "Content: " + entry_content
        
      entry_date = doc.at_css(".article-date")
      
      unless entry_date.blank?
        entry_date = entry_date.text.match(/Date de publication: (.*)/)[1]
        entry_date.strip!
        puts "Date: " + entry_date
      end
      
      source = Source.find_or_create_by(name: organization)
      report = Report.create!(summary: entry_content.strip!, source: source, 
        post_date: date, title: entry_title, date_string: entry_date, cm_url: congomines_url )
        
      report.save  
      pp report  
        
      puts "Fetching PDFs:"
      
      doc.css(".article-download a").each do |pdf|
        pdf_link =  pdf['href']
        pdf_name =  pdf.content
        puts pdf_link 
        puts pdf_name
        report.attachments.create!(asset: URI.parse(URI.encode(pdf_link)))      
        #file = File.open(file_path)
        #report.attachments << file
        #file.close
        #r.save!   
      end

      cats = []      
      doc.css(".cat-links a").each do |c|
        c_text = c.text
        puts "Category: #{c_text}"
        
        found = false

        Category.roots.each do |c|
          #c.children.pluck(:name).each do |child|
          c.children.each do |child|
            if child.name.downcase == c_text.downcase.gsub("'", '’')
              puts "----- Found #{child} in #{c.name}"            
              cats << child
              found = true
            end
          end
        end
        
        unless found
          puts "Adding Company #{c_text}"
          cc = DrcCompany.find_or_create_by(name: c_text)
          cc.reports << report
          puts cc
        end  
      end
      cats.uniq.each {|c| report.categories << c }
        
      report.save
    end
  end
end




