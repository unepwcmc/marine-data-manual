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
        title: t('theme.marine-spatial-planning.title'),
        content: t('theme.marine-spatial-planning.tagline'),
        link: marine_spatial_planning_path,
        cssName: t('theme.marine-spatial-planning.id')
      },
      {
        title: t('theme.education.title'),
        content: t('theme.education.tagline'),
        link: education_path,
        cssName: t('theme.education.id')
      },
      {
        title: t('theme.environmental-impact-assessment.title'),
        content: t('theme.environmental-impact-assessment.tagline'),
        link: environmental_impact_assessment_path,
        cssName: t('theme.environmental-impact-assessment.id')
      },
      {
        title: t('theme.ecosystem-assessment.title'),
        content: t('theme.ecosystem-assessment.tagline'),
        link: ecosystem_assessment_path,
        cssName: t('theme.ecosystem-assessment.id')
      },
      {
        title: t('theme.ecosystem-services.title'),
        content: t('theme.ecosystem-services.tagline'),
        link: ecosystem_services_path,
        cssName: t('theme.ecosystem-services.id')
      }
    ]
  end
end
