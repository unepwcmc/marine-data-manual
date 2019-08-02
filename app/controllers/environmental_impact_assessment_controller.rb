class EnvironmentalImpactAssessmentController < ThemesController

  def index
    @id = 'environmental-impact-assessment'
    @tagline = helpers.environmental_impact_assessment_tagline
    @headerClass = helpers.environmental_impact_assessment_class
    @intro = helpers.environmental_impact_assessment_intro
    @case_study_intro = helpers.environmental_impact_assessment_case_study_intro
    @case_study_bullets = helpers.environmental_impact_assessment_case_study_bullets
    @resources = helpers.environmental_impact_assessment_resources
    @theme = 'environmental-impact-assessment'
  end

end
