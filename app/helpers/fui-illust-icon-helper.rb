module FuiIllustIconHelper
  def self.setup
    illust_icons = ['toilet-paper', 'gift-box', 'pencils', 'clipboard', 'retina', 'compas', 'map', 'chat', 'mail', 'book', 'calendar', 'paper-bag', 'clocks', 'loop']
    illust_icons.each do |icon|
      self.define_illust_icon icon
    end
  end

  private
    def self.define_illust_icon(name)
      method_name = name.gsub(/\-/, '_')
      define_method "fui_#{method_name}_illust_icon" do |options = {}|
        image_tag "/assets/icons/svg/#{name}.svg", alt: "#{name.titleize}", size: options[:size]
      end
    end
end
