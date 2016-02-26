module FuiButtonHelper
  def self.setup
    types = [:default, :primary, :warning, :danger, :success, :inverse, :info]
    types.each do |type|
      self.define_button type
    end
  end

  private
    def self.define_button(name)
      define_method "fui_#{name}_button" do |value, path|
        link_to value, path, class: "btn btn-#{name}"
      end
    end
end
