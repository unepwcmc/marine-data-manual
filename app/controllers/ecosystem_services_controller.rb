class EcosystemServicesController < ThemesController

  def index
    @title = helpers.ecosystem_services_title
    @headerClass = helpers.createClass(@title)
    @intro = helpers.ecosystem_services_intro
    @case_study_intro = helpers.ecosystem_services_case_study_intro
    @case_study_bullets = helpers.ecosystem_services_case_study_bullets
    @resources = helpers.ecosystem_services_resources
  end

end
