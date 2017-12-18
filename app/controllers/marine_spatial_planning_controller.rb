class MarineSpatialPlanningController < ThemesController

  def index
    @title = helpers.MarineSpatialPlanningTitle

    @headerClass = helpers.createClass(@title)

    @intro = helpers.MarineSpatialPlanningIntro
  end

end
