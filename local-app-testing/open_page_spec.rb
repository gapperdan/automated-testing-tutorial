require 'rubygems'
require 'selenium-webdriver'
require 'rspec'

describe "login to my app" do

  TEST_URL = "http://localhost:4567"
  browser = Selenium::WebDriver.for :firefox

  it "should open the browser to the login page" do
    browser.get TEST_URL  #browser.navigate.to TEST_URL
    browser.title.should == "Login page"
  end

  it "should log me in" do
    userid = browser.find_element(:name, 'userid')
    userid.send_keys "12345678"

    password = browser.find_element(:name, 'password')
    password.send_keys "secret"

    password.submit
  end

  it "should close the browser" do
    browser.quit
  end

end

