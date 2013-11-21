require 'capybara'

module PageModule

  class Page
    def title
      Capybara.current_session.title
    end
  end
end