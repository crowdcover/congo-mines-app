class ShareholdersController < ApplicationController
  def show
    @shareholder = Shareholder.includes(:shareholder_relationships,
      :drc_companies).find(params[:id])

    render :show
  end
end
