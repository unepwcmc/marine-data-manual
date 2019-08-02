class EcosystemServicesController < ThemesController

  def index
    @id = 'ecosystem-services'
    @tagline = helpers.ecosystem_services_tagline
    @headerClass = helpers.ecosystem_services_class
    @intro = helpers.ecosystem_services_intro
    @case_study_intro = helpers.ecosystem_services_case_study_intro
    @case_study_bullets = helpers.ecosystem_services_case_study_bullets
    @resources = helpers.ecosystem_services_resources
    @theme = 'ecosystem-services'
  end

end
