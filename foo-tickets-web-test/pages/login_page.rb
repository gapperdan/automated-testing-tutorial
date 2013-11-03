require 'rubygems'
require 'selenium-webdriver'
require '../pages/page'

class LoginPage < Page

  LOGIN_PAGE_URL = 'http://localhost:9393/footix'
  NAME_USERNAME = 'username'
  NAME_PASSWORD = 'password'
  NAME_SUBMIT = 'submit'

  def open
    @@browser.get LOGIN_PAGE_URL
  end

  def login(username,password)
    @@browser.find_element(:name, NAME_USERNAME).send_keys username
    @@browser.find_element(:name, NAME_PASSWORD).send_keys password
    @@browser.find_element(:name, NAME_SUBMIT).click
  end

end