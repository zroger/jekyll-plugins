module Jekyll
  class StylesheetTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      if context.registers[:site].config['base-url']
        context.registers[:site].config['base-url'] + @text
      end
    end
  end

  class LinkTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
      # STDERR.puts text
      # STDERR.puts tokens
    end

    def render(context)
      base_url = context.registers[:site].config['base-url'] || '/'

      "<a href=\"#\">#{@text}</a>"
    end
  end

end

Liquid::Template.register_tag('stylesheet', Jekyll::StylesheetTag)
Liquid::Template.register_tag('link', Jekyll::LinkTag)
