module PageModule
  class Page

    def initialize
      @browser = Capybara.current_session
      self
    end

    def open(url)
      @browser.visit(url)
      self
    end

    def title
      @browser.title
    end

  end
end