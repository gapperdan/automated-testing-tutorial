require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require './jedi_helper'

shared_examples_for 'user login' do |username, page_header|

  it "should log in as #{username} and redirect to #{page_header}" do
    browser = Selenium::WebDriver.for :firefox

    browser.get JediHelper::WEB_URL
    browser.title.should == JediHelper::PAGE_LOGIN_TITLE
    browser.find_element(:name, JediHelper::NAME_USERNAME).send_keys "#{username}"
    browser.find_element(:name, JediHelper::NAME_PASSWORD).send_keys JediHelper::LOGIN_PASSWORD
    browser.find_element(:name, JediHelper::NAME_SUBMIT).click
    browser.find_element(:id, JediHelper::ID_PAGE_HDR).text.should == "#{page_header}"
    browser.find_element(:link_text, JediHelper::TEXT_LOGOUT).click

    browser.quit
  end

end

describe 'jedi training academy website login' do
    it_should_behave_like 'user login', 'yoda', 'Jedi Master Page'
    it_should_behave_like 'user login', 'obi-wan', 'Jedi Knight Page'
    it_should_behave_like 'user login', 'anakin', 'Jedi Padawan Page'
end