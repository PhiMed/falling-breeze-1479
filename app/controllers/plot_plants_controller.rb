class PlotPlantsController < ApplicationController

  def destroy
    PlotPlant.where(plot_id: params[:id], plant_id: params[:plant_id]).destroy_all

    redirect_to '/plots'
  end
end
