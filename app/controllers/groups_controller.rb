class GroupsController < ApplicationController
  GROUPS = {
    "families" => [Family, "Plant families"],
    "habitats" => [Habitat, "Habitats"],
    "garden_uses" => [GardenUse, "Garden uses"]
  }.freeze

  before_action :load_group_type

  def index
    @groups = @model.order(:name)
  end

  def show
    @group = @model.find(params[:id])
    @plants = @group.plants.includes(:family).order(:name, :id)
  end

  private

  def load_group_type
    @model, @heading = GROUPS.fetch(request.path_parameters.fetch(:group))
  end
end
