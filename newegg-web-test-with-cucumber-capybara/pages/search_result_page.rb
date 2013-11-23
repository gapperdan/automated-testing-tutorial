module PageModule

  # SearchResultPage is created either by a user searching for a term or using the navigation menu
  class SearchResultPage < Page

    RESULT_COUNT_XPATH = "//*/div[@class='recordCount']"
    PRODUCT_LIST_DIV = '.productList'
    SELECT_OPTION_VIEW_ID = 'select_top'
    TITLE_ID = 'blaPageTitle'
    VIEW_ITEMS = {'50' => 50, '100' => 100}

    def initialize(search_term)
      @search_term = search_term
      self
    end

    def result
      #expand the list so everything is displayed at one time
      view_nbr_of_items(VIEW_ITEMS['50'])

      within ("#{PRODUCT_LIST_DIV}") do
        @result = all('a', :text => @search_term)
      end
    end

    def count
      str_count = find(:xpath, RESULT_COUNT_XPATH).text
    end

    def view_nbr_of_items(nbr_of_items)
      select(nbr_of_items, :from => SELECT_OPTION_VIEW_ID)
    end

    def title
      find(:id, TITLE_ID).text
    end

  end
end