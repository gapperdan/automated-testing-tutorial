module PageModule
  class SearchResultPage

    def initialize
      @browser = Capybara.current_session
      self
    end

    def results
      @result = all('a', :text => search_term)
    end

    def count

    end
  end
end