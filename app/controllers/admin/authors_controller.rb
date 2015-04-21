class Admin::AuthorsController < Admin::Auth #< ApplicationController
  active_scaffold :"author" do |conf|
  end
end
