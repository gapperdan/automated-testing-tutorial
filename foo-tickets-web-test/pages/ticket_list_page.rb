require 'rubygems'
require 'selenium-webdriver'
require './pages/page'

class TicketListPage < Page

TEST_XPATH_LINK = "//table/tbody/tr[1]/td/a"

  def ticket_count
    @@browser.find_element(:id, 'total_tickets').text
  end

end