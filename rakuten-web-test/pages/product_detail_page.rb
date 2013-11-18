require 'rubygems'
require 'selenium-webdriver'
require '../pages/page'

PRODUCT_DETAIL_ID = 'AuthorArtistTitle_productTitle'
ADD_TO_CART_ID = 'buyButton'
CONTINUE_SHOPPING_XPATH = "//*/span[text()='Continue Shopping']"

class ProductDetailPage < Page

  def initialize(driver)
    @driver = driver
  end

  def name
    @driver.find_element(:id, PRODUCT_DETAIL_ID).text
  end

  def add_to_cart
    @driver.find_element(:id, ADD_TO_CART_ID).click
    self
  end

  def continue_shopping
    sleep 5 #wait for the pop-up to appear
    @driver.find_element(:xpath, CONTINUE_SHOPPING_XPATH).click
  end

end