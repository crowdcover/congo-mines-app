# frozen_string_literal: true

# Site Map
class SitemapController < ApplicationController
  def index
    @staticpages = ['', 'about', 'reports', 'drc_companies', 'rapport-gecamines']

    @companies = DrcCompany.all

    @pages = Page.all

    @reports = Report.all

    @shareholders = Shareholder.all

    @attachments = Attachment.all

    respond_to do |format|
      format.xml
    end
  end
end
