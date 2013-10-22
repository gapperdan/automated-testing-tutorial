require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require "rspec-expectations"

browser = Selenium::WebDriver.for :firefox

#test_url = "http://school.demo.moodle.net/"
TEST_URL = "http://localhost:4567/"
puts "opening url"
#browser.get "http://school.demo.moodle.net/"

browser.manage.window.maximize

browser.navigate.to TEST_URL

puts "Title="+ browser.title

browser.quit