module EnvironmentalImpactAssessmentHelper
  def environmental_impact_assessment_title
    "Environmental impact assessment"
  end

  def environmental_impact_assessment_intro
    "<p>Environmental impact assessment (EIA) refers to the process of examining the anticipated environmental effects of a proposed project, which begins at the project’s design stage. A report is curated and then evaluated by a competent authority, who encompas public responses and decide whether a project is allowed to proceed.</p><p>The development and use of biodiversity tools can support environmental impact assessment reporting, supporting more informed and robust conclusions. For example, the Integrated Biodiversity Assessment Tool for Business (IBAT) provides a gateway to information and tools that aid decisions about biodiversity risk and reports on environmental performance.</p><p>An important emerging regulatory framework on environmental sustainability for business operations is the International Finance Corporation’s (IFC’s) Performance Standard 6 (PS6). Within this framework, biodiversity significance is represented through the concept of ‘Critical Habitat’, a definition developed by the IFC and detailed through criteria aligned with those that support internationally accepted biodiversity designations.</p><p>Martin et al. (2015) present a preliminary global map that classifies more than 13 million km2 of marine and coastal areas of importance for biodiversity based on their overlap with the IFC PS6’s Critical Habitat criteria. This work is likely to be of particular use for industries operating in the marine and coastal realms as an early screening aid prior to in situ Critical Habitat assessment, as well as to financial institutions making investment decisions.</p>"
  end

  def environmental_impact_assessment_case_study_intro
    "Marine and coastal biodiversity data can be used alongside other datasets to support environmental impact assessment and high-level screening. Those hosted on the Ocean Data Viewer have been used by:"
  end

  def environmental_impact_assessment_case_study_bullets
    [
      "<b>Governmental organisations</b> and <b>UN-associated organisations</b> to understand human impacts (e.g. population density, navigation, infrastructure, water quality) and conduct risk assessments (e.g. emergency response preparedness, shoreline erosion, oil spills and pollution) on national and local scales",
      "<b>Academics</b> to map vulnerable areas and/or impacts",
      "<b>Research institutions</b> to undertake environmental assessments or screening, and to combine habitat and climate data to produce emergency preparedness and response strategies (e.g. climate change, coral bleaching, habitat distribution, and fishing)",
      "<b>Proteus Partners</b> to assess the environmental impacts of projects on habitats and provide recommendations (e.g. threat analyses, rapid biodiversity assessments, environmental impact analyses)",
      "The <b>development financing sector</b> and <b>UN-associated organisations</b> to screen areas in comparison to current/potential project sites, including monitoring and assessments on regional and local scales"
    ]
  end

  def environmental_impact_assessment_resources
    [
      {
        title: "Integrated Biodiversity Assessment Tool for Business (IBAT)",
        content: "The Integrated Biodiversity Assessment Tool for Business (IBAT) is a global biodiversity decision-support platform, providing access to information and tools that inform decisions about biodiversity risk and reporting on environmental performance. Access to online maps and toolkits are tailored to business needs and offer information on the location of protected areas, priority sites for conservation and threatened species.",
        url: "https://www.ibatforbusiness.org/"
      },
      {
        title: "A global map to aid the identification and screening of critical habitat for marine industries",
        content: "Industries operating in the marine environment face a number of risks that require analysis before decisions are made on the siting of operations and facilities. This global screening layer aligns with the International Finance Corporation’s Performance Standard 6 criteria, where biodiversity significance is expressed through the concept of “Critical Habitat.” The layer classifies more than 13 million km2 of marine and coastal areas of importance for biodiversity, and can be used to support early screening prior to <i>in situ</i> assessments.",
        url: "https://doi.org/10.1016/j.marpol.2014.11.007"
      }
    ]
  end
end
