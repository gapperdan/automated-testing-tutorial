require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require '../pages/login_page'
require '../pages/ticket_list_page'
require '../pages/ticket_buy_page'

LOGIN_PAGE_TITLE = 'Foo Tickets'
TICKET_LIST_PAGE_TITLE = 'Foo Tix List'
USERNAME = 'john'
PASSWORD = 'password'
NBR_AVAIL_TICKETS = "12"

BUY_ARTIST = 'M83'
BUY_ARTIST_VENUE = 'Regency Ballroom'
BUY_ARTIST_SEAT = 'General Admission'
BUY_ARTIST_PRICE = '35'
BUY_ARTIST_ROW_NBR = 5

CREDIT_CARD_TYPE_VISA = 'Visa'

describe 'the foo tix website' do

  before(:all) do
    @@browser = Selenium::WebDriver.for :firefox
    @ticket_list_page
  end

  it 'should log me in' do
    @login_page = LoginPage.new
    @login_page.open
    @login_page.title.should == LOGIN_PAGE_TITLE
    @login_page.login('joe','password')
  end

  it 'should show me a list of available tickets to buy' do
    @ticket_list_page = TicketListPage.new
    @ticket_list_page.title.should == TICKET_LIST_PAGE_TITLE
    @ticket_list_page.ticket_count.should == NBR_AVAIL_TICKETS
    #@ticket_list_page.close

    #@ticket_list_page.click_link(BUY_ARTIST_ROW_NBR)
  end
  #
  it 'should let me purchase the ticket I want when I click the Buy link' do
    @ticket_buy_page = TicketBuyPage.new
    @ticket_buy_page.artist.should == BUY_ARTIST
    @ticket_buy_page.venue.should == BUY_ARTIST_VENUE
    @ticket_buy_page.seat.should == BUY_ARTIST_SEAT
    @ticket_buy_page.price.should == BUY_ARTIST_PRICE
    @ticket_buy_page.total_price.to_f.should == @ticket_buy_page.fee.to_f + @ticket_buy_page.price.to_f
    @ticket_buy_page.pay_by_credit_card
  end

  #it 'should show me the list of available tickets is 1 less' do
  #  @ticket_list_page = TicketListPage.new
  #  @ticket_list_page.ticket_count.to_i.should == NBR_AVAIL_TICKETS.to_i - 1
  #end

  after(:all) do
    @@browser.close
  end
end
