module ApplicationHelper
  def siteTitle
    'Marine Data Manual'
  end 

  def titleMetaTag
    content_for?(:title) ? "#{content_for(:title)} | #{siteTitle}"  : siteTitle
  end

  def pageTitle
    content_for?(:title) ? content_for(:title) : siteTitle
  end

  def createClass(string)
    string.downcase.tr(" ", "-")
  end
end
