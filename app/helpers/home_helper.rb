module HomeHelper
  def about
    'The ocean covers 71% of the Earth’s surface, and is host to an estimated 50 to 80% of all life on Earth. The ocean contains some of the most productive ecosystems, vast natural resources and unique habitats, and plays a vital role in regulating the Earth’s climate. However, the marine environment is facing many pressures, from the impacts of climate change to overfishing, microplastics and marine litter. Data and information are therefore required to support adaptive conservation and resource management that can help to mitigate these impacts, and to conserve the species and habitats that are necessary for our wellbeing. This metadata library addresses this lack of information by providing an overview of global marine and coastal datasets of biodiversity importance, including some datasets of regional interest. First established as a report in 2014, this library has grown quickly each year, with an ever-expanding list of ocean-related resources that can be found online, providing information on and links to these resources.'
  end

  def themes 
    [
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
