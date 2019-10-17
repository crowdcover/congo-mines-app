module Admin::ShareholdersHelper

  def shareholder_name_column(record, column)
    link_to(record.try(:name),record, target: "_blank")
  end


    def shareholder_website_column(record, column)
      link_to(record.try(:website), record.try(:website), target: "_blank") if record.website.present?
    end

end
