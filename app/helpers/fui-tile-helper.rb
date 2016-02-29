module FuiTileHelper
  def fui_tile(icon_type, title, content, button_type, button_text, button_link, options = {})
    content_tag(:div, class: 'tile') do
      concat tag :img, src: "/assets/icons/svg/ribbon.svg", alt: "ribbon", class: "tile-hot-ribbon" if options[:ribbon]
      concat send "fui_#{icon_type}_illust_icon", class: 'tile-image big-illustration'
      concat content_tag(:h3, title, class: 'tile-title')
      concat content_tag(:p, content)
      concat send "fui_#{button_type}_button", button_text, button_link
    end
  end
end
