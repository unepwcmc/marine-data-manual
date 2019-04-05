class ContactController < ApplicationController
  def index
    @contact_form = [
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
            type: 'text_field',
            required: true,
            comment: 'Please enter URL link'
          },
          {
            id: 'licence_link',
            label: 'Link to licence',
            type: 'text_field',
            required: true,
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
          },
        ]
      }
    ]
  end
end
