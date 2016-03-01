module FuiButtonHelper
  def self.setup
    types = [:default, :primary, :warning, :danger, :success, :inverse, :info]
    types.each do |type|
      self.define_button type
    end
  end

  private
    def self.define_button(name)
      define_method "fui_#{name}_button" do |value, path, options = {}|
        class_value = "btn btn-#{name}"
        class_value << " btn-hg" if options[:hg]
        class_value << " btn-embossed" if options[:embossed]
        class_value << " btn-wide" if options[:wide]
        if options[:tips]
          link_to path, class: class_value do
            concat value
            concat content_tag :span, options[:tips], class: "btn-tip"
          end
        else
          link_to value, path, class: class_value
        end
      end
    end
end
