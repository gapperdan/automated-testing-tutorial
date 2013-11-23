module PageModule
  class HomePage < Page

    SEARCH_FIELD_ID = 'haQuickSearchBox'
    SEARCH_LINK_TEXT = 'Search'

    def search(search_term)
      fill_in(SEARCH_FIELD_ID, :with => search_term)
      find_link(SEARCH_LINK_TEXT).click
      PageModule::SearchResultPage.new(search_term)
    end

    def navigate(path)
      path.each {|one_path| find_link(one_path).click}

      #return an instance of the SearchResultPage
      PageModule::SearchResultPage.new(nil)
    end

  end

end