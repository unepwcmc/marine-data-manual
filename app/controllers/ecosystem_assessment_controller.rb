class EcosystemAssessmentController < ThemesController

  def index
    @title = helpers.ecosystem_assessment_title
    @headerClass = helpers.create_class(@title)
    @intro = helpers.ecosystem_assessment_intro
    @case_study_intro = helpers.ecosystem_assessment_case_study_intro
    @case_study_bullets = helpers.ecosystem_assessment_case_study_bullets
    @resources = helpers.ecosystem_assessment_resources
  end

end
