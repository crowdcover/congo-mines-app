class Admin::ReportRelationsController  < Admin::Auth # ApplicationController
  active_scaffold :"report_relation" do |conf|
  end
end
