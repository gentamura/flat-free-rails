module FuiFormHelper
  def self.setup
    types = [:default, :success, :error]
    types.each do |type|
      self.define_text_field_tag type
    end
  end

  private
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
