module PageModule
  class SearchResultPage < Page

    RESULT_COUNT_XPATH = "//*/div[@class='recordCount']"
    PRODUCT_LIST_DIV = '.productList'
    SELECT_OPTION_VIEW_ID = 'select_top'

    def initialize(search_term)
      @search_term = search_term
      self
    end

    def result
      #expand the list so everything is displayed at one time
      select('50', :from => SELECT_OPTION_VIEW_ID)

      within ("#{PRODUCT_LIST_DIV}") do
        @result = all('a', :text => @search_term)
      end
    end

    def count
      str_count = find(:xpath, RESULT_COUNT_XPATH).text
    end

  end
end