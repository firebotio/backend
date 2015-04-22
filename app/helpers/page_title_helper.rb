module PageTitleHelper
  def page_title(options = {})
    page_title_symbol = options[:page_title_symbol] || :page_title

    if content_for? page_title_symbol
      content_for page_title_symbol
    else
      "Firebot"
    end
  end
end