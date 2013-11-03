require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require './jedi_helper'
require './pages/login_page'

shared_examples_for 'user login' do |username, page_header|

  it "should log in as #{username} and redirect to #{page_header}" do

    login_page = LoginPage.new
    login_page.open
    login_page.get_title.should == JediHelper::PAGE_LOGIN_TITLE
    login_page.login("#{username}",JediHelper::LOGIN_PASSWORD)
    login_page.get_page_name.should == "#{page_header}"
    login_page.close
  end

end

describe 'jedi training academy website login' do
    it_should_behave_like 'user login', 'yoda', 'Jedi Master Page'
    it_should_behave_like 'user login', 'obi-wan', 'Jedi Knight Page'
    it_should_behave_like 'user login', 'anakin', 'Jedi Padawan Page'
end