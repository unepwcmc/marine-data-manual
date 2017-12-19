class EducationController < ThemesController

  def index
    @title = helpers.education_title
    @headerClass = helpers.create_class(@title)
    @intro = helpers.education_intro
    @case_study_intro = helpers.education_case_study_intro
    @case_study_bullets = helpers.education_case_study_bullets
    @resources = helpers.education_resources
  end

end
