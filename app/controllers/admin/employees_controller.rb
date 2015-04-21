class Admin::EmployeesController < Admin::Auth #ApplicationController
  active_scaffold :"employee" do |conf|
  end
end
