require 'rubygems'
require 'selenium-webdriver'
require '../pages/page'
require '../pages/search_result_page'

SEARCH_FIELD_NAME = 'qu'
SEARCH_BUTTON_XPATH = "//*[@class='search-but']"
ITEMS_IN_CART_ID = 'cart-item-count'

class HomePage < Page

  HOME_PAGE_URL = 'http://www.rakuten.com/'

  def open
    @@browser.get HOME_PAGE_URL
    self
  end

  def search(product)
    @@browser.find_element(:name, SEARCH_FIELD_NAME).send_keys product
    @@browser.find_element(:xpath, SEARCH_BUTTON_XPATH).submit
    return SearchResultPage.new(@@browser)
  end

  def items_in_cart
    @@browser.find_element(:id, ITEMS_IN_CART_ID).text[1...-1] #strip the open and close parentheses
  end

end