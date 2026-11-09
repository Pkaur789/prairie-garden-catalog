class PlantsController < ApplicationController
  def index
    @families = Family.order(:name)
    @query = params[:q].to_s.strip
    @family_id = params[:family_id].presence
    scope = Plant.includes(:family).order(:name, :id)
    if @query.present?
      pattern = "%#{Plant.sanitize_sql_like(@query.downcase, "!")}%"
      scope = scope.where("LOWER(plants.name) LIKE :pattern ESCAPE '!' OR LOWER(plants.catalog_code) LIKE :pattern ESCAPE '!'", pattern: pattern)
    end
    scope = scope.where(family_id: @family_id) if @family_id
    @plants = scope
  end

  def show
    @plant = Plant.includes(:family, :habitats, :garden_uses).find(params[:id])
  end
end
