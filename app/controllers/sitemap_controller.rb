class SitemapController < ApplicationController

  def index

    @staticpages = ['', 'about', 'reports', 'drc_companies']

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