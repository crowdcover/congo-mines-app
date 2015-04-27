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
      replaced = report.date_string
      found = false
      
      if report.date_string.present?
        rept_parts = report.date_string.split("\s")
      
        if rept_parts.length == 1
          report_actual_post_date = Date.parse("jan,1, #{rept_parts.first}") 
        else
          
          rept_parts.each do |p|
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
      else
        report.actual_post_date = report.post_date 
        report.save
      end  
    end
  
  end    
end
