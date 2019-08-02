class MarineSpatialPlanningController < ThemesController

  def index
    @id = 'marine-spatial-planning'
    @tagline = helpers.marine_spatial_planning_tagline
    @headerClass = helpers.marine_spatial_planning_class
    @intro = helpers.marine_spatial_planning_intro
    @case_study_intro = helpers.marine_spatial_planning_case_study_intro
    @case_study_bullets = helpers.marine_spatial_planning_case_study_bullets
    @resources = helpers.marine_spatial_planning_resources
    @theme = 'marine-spatial-planning'
  end

end
