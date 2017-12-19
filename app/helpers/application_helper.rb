module ApplicationHelper
  def site_title
    'Ocean+'
  end 

  def title_meta_tag
    content_for?(:title) ? "#{content_for(:title)} | #{site_title}"  : site_title
  end

  def page_title
    content_for?(:title) ? content_for(:title) : site_title
  end

  def create_class(string)
    string.downcase.tr(" ", "-")
  end

  def url_encode (text)
    ERB::Util.url_encode(text)
  end

  def encoded_page_url
    url_encode(request.original_url)
  end

  def create_social_facebook_link
    title = url_encode('Share ' + page_title + ' on Facebook')
    url = encoded_page_url
    href = 'https://facebook.com/sharer/sharer.php?u=' + url

    link_to '', href, title: title, class: 'icon--social icon--social-facebook', target: '_blank'
  end

  def create_social_linkedin_link
    title = url_encode('Share ' + page_title + ' on LinkedIn')
    url = encoded_page_url
    href = 'https://www.linkedin.com/shareArticle?url=' + url

    link_to '', href, title: title, class: 'icon--social icon--social-linkedin', target: '_blank'
  end

  def create_social_twitter_link
    title = url_encode('Share ' + page_title + ' on Twitter')
    text = url_encode('Ocean+')
    url = encoded_page_url
    href = 'https://twitter.com/intent/tweet/?text=' + text + '&url=' + url
    
    link_to '', href, title: title, class: 'icon--social icon--social-twitter', target: '_blank'
  end

  def create_social_email_link
    title = url_encode('Share ' + page_title + ' via Email')
    url = encoded_page_url
    subject = url_encode(site_title)
    body = url_encode("Explore the list of metadata on #{site_title}\n\n") + url
    href = 'mailto:?subject=' + subject + '&body=' + body

    link_to '', href, title: title, class: 'icon--social icon--social-email', target: '_self'
  end
end
