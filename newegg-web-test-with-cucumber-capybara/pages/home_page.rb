module PageModule
  class HomePage < Page

    HOMEPAGE_URL = 'http://www.newegg.com'
    SEARCH_FIELD_ID = 'haQuickSearchBox'
    PRODUCT_LIST_DIV = '.productList'
    SELECT_OPTION_VIEW_ID = 'select_top'
    SEARCH_LINK_TEXT = 'Search'

    def initialize
      @browser = Capybara.current_session
      self
    end

    def title
      return @browser.title
    end

    def open
      @browser.visit(HOMEPAGE_URL)
      self
    end

    def search(search_term)
      fill_in(SEARCH_FIELD_ID, :with => search_term)
      find_link(SEARCH_LINK_TEXT).click

      #expand the list so everything is displayed at one time
      select('50', :from => SELECT_OPTION_VIEW_ID)

      #select all the products in the result list
      within ("#{PRODUCT_LIST_DIV}") do
        @result = all('a', :text => search_term)
      end
    end

  end

end