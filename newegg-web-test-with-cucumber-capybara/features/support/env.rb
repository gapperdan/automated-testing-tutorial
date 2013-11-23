#-- env.rb is automatically loaded first - should be in the right path i.e., under /features/support
require 'rubygems'
require 'capybara'
require 'selenium-webdriver'
require 'rspec/expectations'

include Capybara::DSL #you need this so steps understand the capybara dsl e.g. visit

Capybara.default_driver = :selenium

#-- include these pages
require File.join(File.dirname(__FILE__), '../../pages/page')
require File.join(File.dirname(__FILE__), '../../pages/home_page')
require File.join(File.dirname(__FILE__), '../../pages/search_result_page')