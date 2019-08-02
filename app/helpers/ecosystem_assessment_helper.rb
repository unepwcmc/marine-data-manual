module EcosystemAssessmentHelper

  def ecosystem_assessment_tagline
    "Effective measurements of biodiversity change require a clear understanding of the biological and ecological characteristics of the feature of interest, and the appropriate scales and time frames over which a significant change in condition would occur. Appropriate data are essential to assess changes in condition, and to respond with appropriate and timely management measures."
  end

  def ecosystem_assessment_class
    "ecosystem-assessment"
  end

  def ecosystem_assessment_intro
    "<p>Limited access to the data required to track long-term changes in marine and coastal ecosystems or species can make it difficult to assess changes in condition, and to respond with appropriate and timely management measures.</p><p>Effective measurements of biodiversity change require a clear understanding of the biological and ecological characteristics of the feature of interest, and the appropriate scale and time frames over which a significant change in health and condition would occur.</p><p>To achieve this, the development and use of biodiversity indicators can help to implement appropriate monitoring initiatives and determine targeted management outcomes, such as the conservation and sustainable use of marine and coastal biodiversity.</p><p>A biodiversity indicator is <i>‘a measure based on verifiable data that conveys information about more than itself’</i>, which can be used to inform decision-making and adaptive management.</p><p>Global datasets are frequently collated from multiple sources over various time frames and with gaps in coverage, and therefore are often not suitable for use in assessments of change. However, they do offer an understanding of the state of our knowledge with regards to the locations and extent of marine and coastal biodiversity globally, and can be complemented or ground-truthed through <i>in situ</i> data collected at the local or national scale.</p><p>In some cases, globally-consistent datasets can be used to develop global indicators, such as those hosted by the Biodiversity Indicators Partnership, which can be used to track progress towards the Aichi Biodiversity Targets.</p>"
  end

  def ecosystem_assessment_case_study_intro
    "Marine and coastal biodiversity data can be used alongside other datasets to support assessments of the health of species and ecosystems. Those hosted on the Ocean Data Viewer have been used by:"
  end

  def ecosystem_assessment_case_study_bullets
    [
      "<b>Governmental and not-for-profit organisations, research institutions</b> and <b>academics</b> to assess the vulnerability, diversity, and threats facing ecosystems and species at national and regional scales, often used alongside other datasets (e.g. IUCN Red List) and to produce reports (e.g. National Biodiversity Strategies and Action Plans)",
      "<b>Not-for-profit organisations</b> and <b>research institutions</b> to assess connectivity between habitats at the national level",
      "<b>Not-for-profit organisations</b> and <b>research institutions</b> to overlay habitat data with species distributions (e.g. corals, birds, or larvae data, or information on migratory routes) or protected area data, and to use in conjunction with climate data to model current and future habitat suitability (e.g. for shorebirds)",
      "<b>Academics</b> to assess the impacts of climate change on biodiversity, such as corals, fish, invasive species, and mammals, at regional and global scales"
    ]
  end

  def ecosystem_assessment_resources
    [
      {
        title: "Sub-Global Assessment Network",
        content: "The Sub-Global Assessment Network (SGAN) is a community of practice, creating a common platform for ecosystem assessment practitioners at sub-global scales (regional, sub-regional, national, sub-national). The platform builds capacity through: training opportunities and e-learning tools; capturing, synthesising and disseminating examples of best practices and lessons learned; supporting knowledge exchange; and helping to build links within the scientific community.",
        url: "http://www.ecosystemassessments.net/"
      },
      {
        title: "Biodiversity Indicators Partnership",
        content: "The Biodiversity Indicators Partnership (BIP) brings together a host of international organisations working on indicator development to provide the best available information on biodiversity indicators and trends.",
        url: "https://www.bipindicators.net/"
      },
      {
        title: "Guidance for National Biodiversity Indicator Development and Use (Biodiversity Indicators Partnership, 2011)",
        content: "This guidance document is designed to help the development of biodiversity indicators at the national level for uses such as reporting, policy-making, environmental management, and education. The document has been separated into two clear sections: the first defines what indicators are and how they may be used, while the second is organised around the Biodiversity Indicator Development Framework and presents a series of key steps in successful indicator development.",
        url: "http://www.bipnational.net/LinkClick.aspx?fileticket=6JNUXXo6xOA%3D&tabid=38&language=en-US"
      },
      {
        title: "Species+",
        content: "Species+, developed by UNEP-WCMC and the Convention on International Trade in Endangered Species of Wild Fauna and Flora (CITES) Secretariat, is a website designed to assist Parties with implementing CITES, the Convention of Migratory Species (CMS) and other multilateral environmental agreements (MEAs). Species+ provides a centralised portal for accessing key information on species of global concern.",
        url: "https://www.speciesplus.net/"
      }
    ]
  end
end
