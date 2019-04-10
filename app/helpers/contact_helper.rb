module ContactHelper
  def field_label field
    label = field[:label]
    label += '<em class="form__required">*</em>' if field[:required]
    label += "<em class=\"form__label-comment\"> (#{field[:comment]})</em>" if field[:comment]

    return label
  end
end
