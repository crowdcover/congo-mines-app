class AddYearToSocialProjects < ActiveRecord::Migration
  def change
    add_column :social_projects, :year, :integer
  end
end
