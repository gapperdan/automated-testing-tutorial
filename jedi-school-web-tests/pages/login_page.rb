require 'rubygems'
require 'selenium-webdriver'

class LoginPage

  LOGIN_PAGE_URL = 'http://localhost:9393'
  NAME_USERNAME = 'username'
  NAME_PASSWORD = 'password'
  NAME_SUBMIT = 'submit'
  ID_PAGE_HDR = 'page_hdr'

  @browser = nil;

  def initialize
    @browser = Selenium::WebDriver.for :firefox
  end

  def open
    @browser.get LOGIN_PAGE_URL
  end

  def close
    @browser.quit
  end

  def get_title
     @browser.title
  end

  def login(username,password)
    @browser.find_element(:name, NAME_USERNAME).send_keys username
    @browser.find_element(:name, NAME_PASSWORD).send_keys password
    @browser.find_element(:name, NAME_SUBMIT).click
  end

  def get_page_name
    @browser.find_element(:id, ID_PAGE_HDR).text
  end

end