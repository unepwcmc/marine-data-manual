class HomeController < ApplicationController
  def index
    @themes = [
      {
        title: 'Marine spatial planning',
        content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inven tore veritatis et quasi arc hitecto beatae',
        link: marine_spatial_planning_path,
        cssName: 'marine-spatial-planning'
      },
      {
        title: 'Education',
        content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inven tore veritatis et quasi arc hitecto beatae',
        link: education_path,
        cssName: 'education'
      },
      {
        title: 'Environmental impact assessment',
        content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inven tore veritatis et quasi arc hitecto beatae',
        link: environmental_impact_assessment_path,
        cssName: 'environmental-impact-assessment'
      },
      {
        title: 'Ecosystem assessment',
        content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inven tore veritatis et quasi arc hitecto beatae',
        link: ecosystem_assessment_path,
        cssName: 'ecosystem-assessment'
      },
      {
        title: 'Ecosystem services and natural capital',
        content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inven tore veritatis et quasi arc hitecto beatae',
        link: ecosystem_services_path,
        cssName: 'ecosystem-services'
      }
    ]
  end
end