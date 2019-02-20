require 'csv'

class Metadata < ApplicationRecord
  TABLE_HEADERS = [
    {
      name: "category",
      title: "Category",
      sortButtons: true,
      onMobile: false
    },
    {
      name: "resource",
      title: "Resource",
      sortButtons: true,
      onMobile: true
    },
    {
      name: "contact_organisation",
      title: "Contact Organisation",
      sortButtons: true,
      onMobile: false
    },
    {
      name: "themes",
      title: "Themes",
      sortButtons: false,
      onMobile: false
    }
  ].to_json

  def self.metadata(params, pagination = true)
    output = []
    filters = sanitize_params(params['filters'])
    filter_data = if params.dig('filters').present?
                    data = Metadata.where(filters)
                    factsheet_filter(params['filters'], data)
                  else
                    Metadata.all
                  end
    metadata = sorting_data(params, filter_data, pagination)
    metadata.to_a.each do |meta|
      meta_attributes = meta.attributes
      meta_attributes[:metadata] = metadata_url(meta)
      meta_attributes[:themes] = []
      ["marine_spatial_planning", "education", "environmental_impact_assessment",
      "ecosystem_assessment", "ecosystem_services"].each do |attribute|
        meta_attributes[:themes] << attribute.capitalize.tr('_', ' ') if meta_attributes[attribute]
        meta_attributes.delete(attribute)
      end
      meta_attributes.delete_if { |k| ["created_at", "updated_at"].include? k }
      output << meta_attributes
    end
    [output, filter_data.count]
  end

  def self.sorting_data(params, data, pagination)
    field = params['sortField'].presence || 'id'
    direction = params['sortDirection'].presence || 'ASC'
    page = pagination ? params['requested_page'] || 1 : 1
    data.order("#{field} #{direction}")
        .paginate(page: page, per_page: pagination ? 10 : data.count)
  end

  def self.sanitize_params(filters)
    return if filters.nil?
    query = {}
    filters.each do |filter|
      if filter['name'] == 'themes' && filter['options'].present?
        filter['options'].each { |option| query[option.parameterize.underscore] = 'true' }
      else
        query[filter['name']] = filter['options']
      end
    end
    query.delete_if { |k, v| v.empty? || k == 'factsheet' }
  end

  def self.factsheet_filter(filters, data)
    return data unless filters.each { |filter| 'factsheet'.include? filter['name'] }
    sheet_filter = filters.select { |filter| filter['name'] == 'factsheet' }.first
    return data if sheet_filter['options'].empty?
    sheet_filter['options'].first ? data.where.not(factsheet: nil) : data.where(factsheet: nil)
  end

  def self.metadata_url(meta)
    meta.metadata ? pdf_download_link : nil
  end

  def self.pdf_download_link
    "http://wcmc.io/metadata"
  end

  def self.to_csv(metadata)
    csv_string = CSV.generate(encoding: 'UTF-8') do |csv|
      metadata_columns = Metadata.new.attributes.keys
      metadata_columns.delete_if { |k| ["id", "created_at", "updated_at"].include? k }

      metadata_columns.map! { |e| e.tr('_', ' ').capitalize }

      csv << metadata_columns.flatten

      data = Metadata.where(id: metadata.pluck('id'))
      data.to_a.each do |meta|
        metadata_attributes = meta.attributes
        metadata_attributes.delete_if { |k| ["id", "created_at", "updated_at"].include? k }

        metadata_attributes = metadata_attributes.values.map(&:to_s)
        csv << metadata_attributes
      end
      csv
    end
    csv_string
  end
end
