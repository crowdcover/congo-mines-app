# frozen_string_literal: true

# Static Pages
class StaticPagesController < ApplicationController
  def home
    @rec_reports = Report.where(recommended: true).order('actual_post_date DESC').take(4)

    # use this variable on home page (instead of @rec_reports) and use that partial
    # while there are no reports marked as recommended
    @reports = Report.all.order('actual_post_date DESC').take(4)
  end

  def about
    @about = SpecialReport.where(tag: 'about').fetch(0)
    @title_localized = if I18n.locale == :en
      @about.title_en
    else
      @about.title
    end
  end

  def specialreport
    @special_report = SpecialReport.where(tag: 'special').fetch(0)
    @title_localized = if I18n.locale == :en
      @special_report.title_en
    else
      @special_report.title
    end
  end
end
