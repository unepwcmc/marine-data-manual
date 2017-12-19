class MarineSpatialPlanningController < ThemesController

  def index
    @title = helpers.marine_spatial_planning_title

    @headerClass = helpers.createClass(@title)

    @intro = helpers.marine_spatial_planning_intro

    @case_study_intro = helpers.marine_spatial_planning_case_study_intro

    @case_study_bullets = helpers.marine_spatial_planning_case_study_bullets

    @resources = helpers.marine_spatial_planning_resources
  end

end
