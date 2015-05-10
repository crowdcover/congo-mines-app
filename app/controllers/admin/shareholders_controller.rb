class Admin::ShareholdersController  < Admin::Auth # ApplicationController
  active_scaffold :"shareholder" do |config|

    config.columns.exclude(:drc_companies, :created_at, :updated_at)

    #config.columns[:drc_companies].options = {:draggable_lists => true}
    #config.columns[:drc_companies].form_ui = :chosen

  end
end
