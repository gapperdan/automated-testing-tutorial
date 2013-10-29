require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require './jedi_helper'

browser = Selenium::WebDriver.for :firefox

describe "jedi school website" do

  it "should log me in as jedi master" do

    browser.get JediHelper::WEB_URL

    browser.title.should == JediHelper::PAGE_LOGIN_TITLE

    browser.find_element(:name, JediHelper::NAME_USERNAME).send_keys JediHelper::LOGIN_JEDI_MASTER_USERNAME
    browser.find_element(:name, JediHelper::NAME_PASSWORD).send_keys JediHelper::LOGIN_PASSWORD
    browser.find_element(:name, JediHelper::NAME_SUBMIT).click

    browser.find_element(:id, JediHelper::ID_PAGE_HDR).text.should == JediHelper::PAGE_HDR_JEDI_MASTER

    browser.find_element(:link_text, JediHelper::TEXT_LOGOUT).click
    browser.quit

  end
end