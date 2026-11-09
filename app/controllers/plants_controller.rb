class PlantsController < ApplicationController
  def index
    @families = Family.order(:name)
    @query = params[:q].to_s.strip
    @family_id = params[:family_id].presence
    @plants = Plant.includes(:family).order(:name, :id)
  end

  def show
    @plant = Plant.includes(:family, :habitats, :garden_uses).find(params[:id])
  end
end
