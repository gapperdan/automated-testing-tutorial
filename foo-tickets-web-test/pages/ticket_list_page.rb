require 'rubygems'
require 'selenium-webdriver'
require '../pages/page'

class TicketListPage < Page

LINK_TEXT = 'Buy'

  def initialize
    all_links
  end

  def ticket_count
    @@browser.find_element(:id, 'total_tickets').text
  end

  def link_href(index)
    link = @links[index-1] #0-based array
    link.attribute('href')
  end

  def link_text(index)
    link = @links[index-1]
    link.attribute('text')
  end

  def click_link(index)
    link = @links[index-1]
    link.click
  end

  private
  def all_links
    @links = @@browser.find_elements(:link_text, LINK_TEXT)
  end

end
