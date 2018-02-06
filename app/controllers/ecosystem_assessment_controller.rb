class EcosystemAssessmentController < ThemesController

  def index
    @title = helpers.ecosystem_assessment_title
    @tagline = helpers.ecosystem_assessment_tagline
    @headerClass = helpers.ecosystem_assessment_class
    @intro = helpers.ecosystem_assessment_intro
    @case_study_intro = helpers.ecosystem_assessment_case_study_intro
    @case_study_bullets = helpers.ecosystem_assessment_case_study_bullets
    @resources = helpers.ecosystem_assessment_resources
    @theme = helpers.remove_spaces(@title)
  end

end
