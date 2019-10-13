class CustomFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, options = {})
    msg = error_message(method)
    error_class(options) if msg.present?
    super + error_html(msg)
  end

  def email_field(method, options = {})
  msg = error_message(method)
  error_class(options) if msg.present?
  super + error_html(msg)
end

  private

  def error_message(method)
    (@object.errors[method].size > 0) ? I18n.t("activerecord.attributes.#{@object.model_name.singular}.#{method}") + @object.errors[method].first : ""
  end

  def error_class(options)
    if options[:class].present?
      options[:class] << " invalid"
    else
      options[:class] = "invalid"
    end
  end

  def error_html(msg)
    return "" if msg.blank?

    @template.content_tag(:div, class: "error_message") do
      @template.concat (@template.content_tag(:span, class: 'helper-text', :data => {:error => "#{msg}", :success => "right"}) do
        msg
      end)
    end
  end
end