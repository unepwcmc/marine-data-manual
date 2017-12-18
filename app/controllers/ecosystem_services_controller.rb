class EcosystemServicesController < ThemesController

  def index
    @title = helpers.EcosystemServicesTitle

    @headerClass = helpers.createClass(@title)

    @intro = helpers.EcosystemServicesIntro
  end

end
