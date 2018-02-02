module EducationHelper
  def education_title
    "Education"
  end

  def education_class
    "education"
  end

  def education_intro
    "<p>Marine datasets and the tools that accompany them can be useful in an educational setting to further students’ understanding of the ocean, and to support the teaching of new subjects and software.</p><p>For example, data layers can often be downloaded as shapefiles and used to teach students how to use ArcGIS or open source mapping software, such as QGIS. This provides students with an opportunity to work with datasets that demonstrate the current state of knowledge with regards to the ocean, while also learning new skills.</p>"
  end

  def education_case_study_intro
    "Marine and coastal biodiversity data can be used alongside other datasets to support educational projects. Those hosted on the <b>Ocean Data Viewer</b> have been used by:"
  end

  def education_case_study_bullets
    [
      "<b>Academics</b> and <b>teachers</b> to teach ArcGIS to students, and to strengthen their understanding of global biodiversity in the ocean",
      "<b>Governments</b> to develop public awareness campaigns and educational displays at international meetings",
      "<b>Not-for-profits</b> to educate themselves or others (e.g. training, education, workshops)",
      "The <b>media</b> to educate the  public and raise awareness of environmental issues",
      "The <b>technology sector</b> to educate their staff or others and to develop related software"
    ]
  end

  def education_resources
    [
      {
        title: "Ocean Data Viewer",
        content: "<p>The <i>Ocean Data Viewer</i> is an online tool that offers the opportunity to view and download a range of spatial datasets. These datasets are useful for teaching students about the locations of marine and coastal biodiversity, including habitats such as coral reefs, seagrasses, and mangroves.</p><p>These datasets have been used by government agencies, scientists, researchers, the corporate sector, and non-governmental organisations to inform decision-making in order to sustainably use and conserve ocean resources.</p>",
        url: "http://data.unep-wcmc.org/"
      },
      {
        title: "Protected Planet",
        content: "<p>Protected Planet is a publicly available online platform that hosts the most up-to-date information on terrestrial and marine protected areas. The site is updated monthly and enables a spectrum of users to utilise data for information-based decision making, policy development, and business and conservation planning.</p><p>Users can access area statistics and download data from the World Database on Protected Areas (WDPA). Protected Planet is managed by the UN Environment World Conservation Monitoring Centre (UNEP-WCMC) with support from IUCN and its World Commission on Protected Areas (WCPA).</p>",
        url: "http://www.wdpa.org/"
      },
      {
        title: "The Importance of Mangroves to People",
        content: "<i>The Importance of Mangroves to People</i> provides accessible information and downloadable images on the location and ecology of mangroves (Chapter 1). There is also information on the services and benefits that mangroves provide to humans, as well as the risks associated with losing these services as a result of ongoing global habitat loss and degradation (Chapters 2 and 3). The report concludes with management and policy options at the local, regional and global level that could prevent further losses through effective conservation measures, sustainable management and successful restoration (Chapter 4).",
        url: "https://www.unep-wcmc.org/resources-and-data/the-importance-of-mangroves-to-people--a-call-to-action"
      }
    ]
  end
end
