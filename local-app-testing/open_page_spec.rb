require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require "rspec-expectations"

describe "local app test" do

  TEST_URL = "http://localhost:4567"
  browser = Selenium::WebDriver.for :firefox

  it "should open the login page" do
    browser.get TEST_URL  #browser.navigate.to TEST_URL
    browser.title.should == "Login page"

    browser.quit
  end

end

