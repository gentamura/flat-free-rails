module FuiIconHelper
  def self.setup
    glyphs = [
      'info-circle', 'alert-circle', 'question-circle', 'check-circle', 'cross-circle',
      'plus-circle', 'window', 'windows', 'upload', 'arrow-right','arrow-left', 'loop',
      'cmd', 'mic', 'export', 'heart', 'location', 'plus', 'check','cross', 'list', 'new',
      'video', 'photo', 'time', 'eye', 'chat', 'home', 'search', 'user', 'mail', 'lock',
      'power', 'star', 'calendar', 'gear', 'bookmark', 'exit', 'trash', 'folder', 'bubble',
      'calendar-solid', 'star-2', 'credit-card', 'clip', 'link', 'pause', 'play', 'volume',
      'mute', 'resize', 'tag', 'document', 'image', 'triangle-up', 'triangle-up-small',
      'triangle-right-large', 'triangle-left-large', 'triangle-down', 'triangle-down-small',
      'radio-unchecked', 'radio-checked', 'checkbox-unchecked', 'checkbox-checked',
      'list-thumbnailed', 'list-small-thumbnails', 'list-numbered', 'list-large-thumbnails',
      'list-columned', 'list-bulleted'
    ]
    glyphs.each do |glyph|
      self.define_icon glyph
    end

    socials = [
      "facebook", "youtube", "vimeo", "twitter", "stumbleupon", "spotify", "skype",
      "pinterest", "path", "linkedin", "google-plus", "dribbble", "behance", "yelp",
      "wordpress", "windows-8", "vine", "tumblr", "paypal", "lastfm", "instagram",
      "html5", "github", "foursquare", "dropbox", "android", "apple"
    ]
    socials.each do |social|
      self.define_icon social
    end
  end

  private
    def self.define_icon(name)
      method_name = name.gsub(/\-/, '_')
      define_method "fui_#{method_name}_icon" do
        content_tag(:span, '', class: "fui-#{name}")
      end
    end
end
