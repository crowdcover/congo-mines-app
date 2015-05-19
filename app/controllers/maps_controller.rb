class MapsController < ApplicationController
  def show
  end

  def get_all_deposits
    @deposits = Deposit.all
  end

  def get_all_processing_infrastructures
    @processing_infrastructures = ProcessingInfrastructure.all
  end

  def get_all_social_projects
    @social_projects = SocialProject.all
  end
end
