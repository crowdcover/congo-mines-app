class ModifyReportDates < ActiveRecord::Migration
  def change
      month_names = {
      'janvier'   => 'january',
      'février'   => 'feburary',
      'mars'      => 'march',
      'avril'     => 'april',
      'mai'       => 'may',
      'juin'      => 'june',
      'juillet'   => 'july',
      'août'      =>'august',
      'septembre' => 'september',
      'octobre'   => 'october',
      'novembre'  => 'november',
      'décembre'  => 'december',
    }

    Report.all.each do |report|    
      # nk  = k.gsub(/(\d+) (\w+) (\d{4})/, "#{$2}, #{$1}, #{$3}")
      replaced = report.date_string
      found = false
      
      next if report.date_string.blank?
      
      report.date_string.split("\s").each do |p|
        puts "Beginning: #{p}"
        if month_names.has_key?(p)
          puts "found name: #{p}"
          replaced = replaced.gsub(p, month_names[p])
          puts replaced
          found = true
          break          
        end 
      end
      
      if found
        nd =  Date.parse(replaced)
        puts "NEW DATE: #{nd}"
        report.actual_post_date = nd
        report.save
        puts "-" * 20      
      end
    end
  
  end
end
