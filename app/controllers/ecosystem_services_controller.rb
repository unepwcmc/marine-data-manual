class EcosystemServicesController < ThemesController

  def index
    @title = helpers.ecosystem_services_title
    @tagline = helpers.ecosystem_services_tagline
    @headerClass = helpers.ecosystem_services_class
    @intro = helpers.ecosystem_services_intro
    @case_study_intro = helpers.ecosystem_services_case_study_intro
    @case_study_bullets = helpers.ecosystem_services_case_study_bullets
    @resources = helpers.ecosystem_services_resources
    @theme = helpers.remove_spaces(@title)
  end

end
