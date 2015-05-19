class ShareholdersController < ApplicationController
  def show
    @shareholder = Shareholder.includes(:drc_companies).find(params[:id])

    render :show
  end
end
