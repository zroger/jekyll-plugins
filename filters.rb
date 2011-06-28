module Jekyll
  # Adds some extra filters used during the category creation process.
  module Filters

    # Outputs a list of categories as comma-separated <a> links. This is used
    # to output the category list for each post on a category page.
    #
    #  +categories+ is the list of categories to format.
    #
    # Returns string
    def category_links(categories)
      categories = categories.sort!.map do |item|
        '<a href="/categories/'+item+'/">'+item+'</a>'
      end

      connector = "and"
      case categories.length
      when 0
        ""
      when 1
        categories[0].to_s
      when 2
        "#{categories[0]} #{connector} #{categories[1]}"
      else
        "#{categories[0...-1].join(', ')}, #{connector} #{categories[-1]}"
      end
    end

    # Outputs the post.date as formatted html, with hooks for CSS styling.
    #
    #  +date+ is the date object to format as HTML.
    #
    # Returns string
    def date_to_html_string(date)
      result = '<span class="month">' + date.strftime('%b').upcase + '</span> '
      result += date.strftime('<span class="day">%d</span> ')
      result += date.strftime('<span class="year">%Y</span> ')
      result
    end

    def category_links_array(categories)
      categories = categories.sort!.map do |item|
        '<a href="/tags/'+item+'/">'+item+'</a>'
      end
      categories
    end

    def date_to_month(input)
      Date::MONTHNAMES[input]
    end

    def date_to_month_abbr(input)
      Date::ABBR_MONTHNAMES[input]
    end

    def markdownify(input)
      RDiscount.new(input).to_html
    end

  end
end