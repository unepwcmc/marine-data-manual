module HomeHelper
  def home_page_title
    'Diving into marine data'
  end

  def about
    '<p>Home to more than half of all life on Earth, the Ocean covers over 70% of the surface of the planet.</p><p>The ocean contains some of the most productive ecosystems, vast natural resources, and unique habitats on Earth. The ocean also plays a vital role in regulating the planet’s climate. However, the marine environment is facing many pressures, from the impacts of climate change and overfishing to the effects of pollution from microplastics and marine litter.</p><p>Accurate and up-to-date data and information are required to support adaptive conservation and resource management that can help to mitigate these impacts, and to conserve marine species and habitats.</p><p><b>Ocean+ Data</b> addresses this need for information by providing an overview of global marine and coastal datasets of biodiversity importance, including some datasets of regional interest.</p>'
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
