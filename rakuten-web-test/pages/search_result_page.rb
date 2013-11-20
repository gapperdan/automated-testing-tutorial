require 'rubygems'
require 'selenium-webdriver'
require '../pages/page'
require '../pages/product_detail_page'

RESULT_XPATH = "//*[@id='ResultsHeader_ResultsText']/span"

class SearchResultPage < Page

  def initialize(driver)
    @driver = driver
  end

  def nbr_result
    @driver.find_element(:xpath, RESULT_XPATH).text
  end

  def click(link_text)
    # wait for a specific element to show up
    wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
    wait.until { @driver.find_element(:link_text, link_text) }

    @driver.find_element(:link_text, link_text).click
    ProductDetailPage.new(@driver)
  end

end