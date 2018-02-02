module HomeHelper
  def about
    '<p>Home to more than half of all life on Earth, the Ocean covers over 70% of the surface of the planet.</p><p>The ocean contains some of the most productive ecosystems, vast natural resources, and unique habitats on Earth. The ocean also plays a vital role in regulating the planet’s climate. However, the marine environment is facing many pressures, from the impacts of climate change and overfishing to the effects of pollution from microplastics and marine litter.</p><p>Accurate and up-to-date data and information are required to support adaptive conservation and resource management that can help to mitigate these impacts, and to conserve marine species and habitats.</p><p>Ocean+ Data addresses this need for information by providing an overview of global marine and coastal datasets of biodiversity importance, including some datasets of regional interest.</p>'
  end

  def themes 
    [
      {
        title: 'Marine spatial planning',
        content: 'Marine spatial planning involves managing competing interests by planning where different activities will happen. Marine and coastal biodiversity data can be used to guide spatial planning and identify priority areas for conservation.',
        link: marine_spatial_planning_path,
        cssName: 'marine-spatial-planning'
      },
      {
        title: 'Education',
        content: 'Marine datasets and the tools that accompany them can be useful in an educational setting to further students’ understanding of the ocean, and to support the teaching of marine-related subjects and software.',
        link: education_path,
        cssName: 'education'
      },
      {
        title: 'Environmental impact assessment',
        content: 'Environmental impact assessments (EIAs) examine the anticipated environmental effects of proposed projects, which begin at the design stage. Suitable data informing predictions of an activity impact on the marine ecosystem are therefore required to effectively assess environmental impacts.',
        link: environmental_impact_assessment_path,
        cssName: 'environmental-impact-assessment'
      },
      {
        title: 'Ecosystem assessment',
        content: 'Effective measurements of biodiversity change require a clear understanding of the biological and ecological characteristics of the feature of interest, and the appropriate scales and time frames over which a significant change in condition would occur. Appropriate data are essential to assess changes in condition, and to respond with appropriate and timely management measures.',
        link: ecosystem_assessment_path,
        cssName: 'ecosystem-assessment'
      },
      {
        title: 'Ecosystem services and natural capital',
        content: 'Natural capital and ecosystem services underpin our economy and society, and are therefore directly relevant to policy and business decision-making. Improved data enables the development of ecosystem valuation indicators that can be incorporated into government and businesses management.',
        link: ecosystem_services_path,
        cssName: 'ecosystem-services-and-natural-capital'
      }
    ]
  end
end
