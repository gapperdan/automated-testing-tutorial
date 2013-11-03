require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require './pages/login_page'
require './pages/ticket_list_page'

LOGIN_PAGE_TITLE = 'Foo Tickets'
TICKET_LIST_PAGE_TITLE = 'Foo Tix List'
USERNAME = 'john'
PASSWORD = 'password'

describe 'the foo tix website' do

  before(:all) do
    @@browser = Selenium::WebDriver.for :firefox
  end

  it 'should log me in' do
    @login_page = LoginPage.new
    @login_page.open
    @login_page.title.should == LOGIN_PAGE_TITLE
    @login_page.login('joe','password')
    #login_page.close

  end

  it 'should show me a list of tickets' do

    @ticket_list_page = TicketListPage.new
    @ticket_list_page.title.should == TICKET_LIST_PAGE_TITLE
    @ticket_list_page.ticket_count.should == '12'

  end

  it 'should show me the purchase page when I buy a ticket'

  after(:all) do
    @@browser.close
  end
end


