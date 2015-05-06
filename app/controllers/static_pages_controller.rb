class StaticPagesController < ApplicationController
  def home
    @reports = Report.all.order('actual_post_date DESC') # need to add query for featured
  end

  def about
  end
end
