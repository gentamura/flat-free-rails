module FuiFormHelper
  def self.setup
    types = [:default, :success, :error]
    types.each do |type|
      self.define_text_field_tag type
    end
  end

  def fui_checkbox(text, id, options = {})
    content_tag :label, class: "checkbox", for: id do
      concat tag :input, type: "checkbox", id: id, class: "custom-checkbox", data: { toggle: "checkbox" }, checked: options[:checked], disabled: options[:disabled], name: options[:name]
      concat icon_tags
      concat text
    end
  end

  # Radio button : collection
  def fui_radio_buttons(name, attrs = {})
    raise "Empty Error: The second argument hash is empty." if attrs.empty?
    attrs.each_with_object "" do |(key, value), tags|
      tags << fui_radio(name, key, value)
    end.html_safe
  end

  # Radio button : single
  def fui_radio_button(name, id, text, options = {})
    fui_radio(name, id, text, options)
  end

  private
    def fui_radio(name, id, text, options = {})
      content_tag :label, class: "radio", for: id do
        concat tag :input, type: "radio", id: id, class: "custom-radio", name: name, data: { toggle: "radio" }, checked: options[:checked], disabled: options[:disabled]
        concat icon_tags
        concat text
      end
    end

    def icon_tags
      content_tag :span, class: "icons" do
        concat content_tag :span, '', class: "icon-unchecked"
        concat content_tag :span, '', class: "icon-checked"
      end
    end

    def self.define_text_field_tag(type)
      define_method "fui_#{type}_text_field_tag" do |name, value = nil, options = {}|
        default_options = { class: " form-control" }
        if options.has_key?(:class)
          options.merge!(default_options) do |key, self_val, other_val|
            self_val << other_val if key == :class
          end
        else
          default_options[:class].strip!
          options.merge!(default_options)
        end

        if type == :default
          group_class = "form-group"
        elsif type == :success or type == :error
          group_class = "form-group has-#{type}"
        else
          raise "Type Error"
        end
        content_tag :div, text_field_tag(name, value, options), class: group_class
      end
    end
end
