class EducationController < ThemesController

  def index
    @title = helpers.EducationTitle

    @headerClass = helpers.createClass(@title)

    @intro = helpers.EducationIntro
  end

end
