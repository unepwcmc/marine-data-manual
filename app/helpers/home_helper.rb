module HomeHelper
  def title
    'Dive into Marine data'
  end

  def about
    '<p>Ocean+ Library connects to the latest data and online resources on ocean biodiversity.</p><p>With technological advances, access to and use of the ocean has increased dramatically, along with available information on the state of the ocean and its resources. Through Ocean+ Library, identify the online data and information you need to make decisions about what matters to you.</p>'
  end

  def theme_title 
    'How can these be used?'
  end

  def theme_intro
    'Marine and coastal data can be used to support a variety of activities and purposes. These have been grouped into five themes and examples for each are provided in the sections below.'
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
