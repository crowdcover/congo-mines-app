json.(@report, :title, :date, :summary, :congolese_companies)

json.source @report.source, :name, :description

json.attachments @report.attachments, :name, :asset_file_name,
  :asset_content_type, :position

json.author @report.author, :name, :description

json.categories @report.categories, :position, :name

json.congolese_companies @report.congolese_companies, :name, :acronym,
  :contact, :website, :legal_status, :project_type

json.(@business, :name, :street_address, :city_name, :postal_code, :state,
      :phone_number, :biz_category, :total_ratings, :avg_reg_rating,
      :avg_sust_rating )

json.reviews @business.reviews, :user_id, :reg_rating, :sust_rating,
                :reg_review, :sust_review, :updated_at
