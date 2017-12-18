class EcosystemAssessmentController < ThemesController

  def index
    @title = helpers.EnvironmentalImpactAssessmentTitle

    @headerClass = helpers.createClass(@title)

    @intro = helpers.EnvironmentalImpactAssessmentIntro
  end

end
