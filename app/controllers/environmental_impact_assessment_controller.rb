class EnvironmentalImpactAssessmentController < ThemesController

  def index
    @title = helpers.environmental_impact_assessment_title
    @headerClass = helpers.createClass(@title)
    @intro = helpers.environmental_impact_assessment_intro
    @case_study_intro = helpers.environmental_impact_assessment_case_study_intro
    @case_study_bullets = helpers.environmental_impact_assessment_case_study_bullets
    @resources = helpers.environmental_impact_assessment_resources
  end

end
