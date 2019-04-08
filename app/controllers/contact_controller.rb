class ContactController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def contact_form
    [
      {
        title: 'Resource details',
        fields: [
          {
            id: 'resource_name',
            label: 'Resource name',
            type: 'text_field',
            required: true
          },
          {
            id: 'resource_location',
            label: 'Resource location',
            type: 'url_field',
            required: true,
            comment: 'Please enter URL link'
          },
          {
            id: 'licence_link',
            label: 'Link to licence',
            type: 'url_field',
            comment: 'Please enter URL link'
          },
          {
            id: 'contact_organisation',
            label: 'Contact organisation',
            type: 'text_field'
          },
          {
            id: 'contact_organisation_email',
            label: 'Contact organisation email',
            type: 'email_field',
            placeholder: 'example@email.com'
          },
          {
            id: 'additional_info',
            label: 'Additional information',
            type: 'text_area'
          },
        ]
      },
      {
        title: 'Contact details',
        intro: 'If you are happy for us to contact you if more information is needed, please add your details here. These will only be used for this purpose and, in accordance with GDPR, will be deleted once the entry (or a full metadata sheet, if appropriate) has been completed.',
        fields: [
          {
            id: 'name',
            label: 'Name',
            type: 'text_field',
          },
          {
            id: 'organisation',
            label: 'Organisation',
            type: 'text_field',
          },
          {
            id: 'email',
            label: 'Email address',
            type: 'email_field',
            placeholder: 'example@email.com'
          },
        ]
      }
    ]
  end

  def index
    @contact_form = contact_form
  end

  def submission
    form_data = params.except(:utf8, :commit, :controller, :action)

    response = contact_form

    response.each do |section|
      section[:fields].each do |field|
        field[:response] = form_data[field[:id]]
      end
    end

    ContactMailer.with(
      response: response
    ).submit_metadata.deliver_now

    respond_to do |f|
      f.html { redirect_to contact_path }
      f.js {  }
    end
  end
end
