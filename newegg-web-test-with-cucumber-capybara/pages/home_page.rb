module PageModule
  class HomePage < Page

    SEARCH_FIELD_ID = 'haQuickSearchBox'
    SEARCH_LINK_TEXT = 'Search'

    def search(search_term)
      fill_in(SEARCH_FIELD_ID, :with => search_term)
      find_link(SEARCH_LINK_TEXT).click
      PageModule::SearchResultPage.new(search_term)
    end

  end

end