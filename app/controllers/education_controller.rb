class EducationController < ThemesController

  def index
    @title = helpers.education_title
    @tagline = helpers.education_tagline
    @headerClass = helpers.education_class
    @intro = helpers.education_intro
    @case_study_intro = helpers.education_case_study_intro
    @case_study_bullets = helpers.education_case_study_bullets
    @resources = helpers.education_resources
    @theme = helpers.remove_spaces(@title)
  end

end
