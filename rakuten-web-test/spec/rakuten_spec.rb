require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require '../pages/home_page'
require '../pages/search_result_page'
require '../pages/product_detail_page'

HOME_PAGE_TITLE = 'Rakuten.com - Computers, Electronics, Digital Cameras, Books, DVDs, Music, Games, Software, Toys, Sports'
SEARCH_RESULT_COUNT = '9'
SEARCH_TEXT = 'Mazinger Z'
RESULT_DETAIL_TEXT = 'Shin Mazinger Z Action Figure'
ITEMS_IN_CART_COUNT = '1'

describe 'the Rakuten website' do

  before(:each) do
    @@browser = Selenium::WebDriver.for :firefox
    @ticket_list_page
  end

  it 'should show the home page and let me search for Mazinger Z' do
    @home_page = HomePage.new
    @home_page
      .open
      .title.should == HOME_PAGE_TITLE

    @search_result_page = @home_page.search(SEARCH_TEXT)
      .nbr_result.should == SEARCH_RESULT_COUNT

	  #sleep 5
    SearchResultPage.new(@@browser)
      .click(RESULT_DETAIL_TEXT)
      .name.should == RESULT_DETAIL_TEXT

  end

  it 'should let me add Shin Mazinger Z Action Figure to the shopping cart' do
    @home_page = HomePage.new
    @home_page
      .open

    @search_result_page = @home_page.search(SEARCH_TEXT)
      .click(RESULT_DETAIL_TEXT)

   ProductDetailPage.new(@@browser)
      .add_to_cart
      .continue_shopping

    sleep 5 #need to wait here, there's an ajax update to the cart
    @home_page.items_in_cart.should == ITEMS_IN_CART_COUNT
  end

  after(:each) do
    @@browser.close
  end
end
