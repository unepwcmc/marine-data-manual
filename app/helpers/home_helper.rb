module HomeHelper
  def title
    'Diving into marine meta data'
  end

  def about
    '<p>Accurate and up-to-date data and information are required to support adaptive conservation and resource management that can help to mitigate these impacts, and to conserve marine species and habitats.</p><p>Ocean+ Library addresses this need for information by providing an overview of global marine and coastal datasets of biodiversity importance, including some datasets of regional interest.</p>'
  end

  def theme_title 
    'Explore how you can use data'
  end

  def themes 
    [
      {
        title: 'Marine spatial planning',
        content: marine_spatial_planning_tagline,
        link: marine_spatial_planning_path,
        cssName: 'marine-spatial-planning'
      },
      {
        title: 'Education',
        content: education_tagline,
        link: education_path,
        cssName: 'education'
      },
      {
        title: 'Environmental impact assessment',
        content: environmental_impact_assessment_tagline,
        link: environmental_impact_assessment_path,
        cssName: 'environmental-impact-assessment'
      },
      {
        title: 'Ecosystem assessment',
        content: ecosystem_assessment_tagline,
        link: ecosystem_assessment_path,
        cssName: 'ecosystem-assessment'
      },
      {
        title: 'Ecosystem services and natural capital',
        content: ecosystem_services_tagline,
        link: ecosystem_services_path,
        cssName: 'ecosystem-services'
      }
    ]
  end
end
