class ShareholdersController < ApplicationController
  def show
    @shareholder = Shareholder.include(:drc_companies).find(params[:id])

    render :show
  end
end
