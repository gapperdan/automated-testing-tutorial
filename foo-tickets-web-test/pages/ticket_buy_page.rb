require 'rubygems'
require 'selenium-webdriver'
require '../pages/page'

XPATH_ARTIST = "//*[@id='data_table']/table/tbody/tr/td[1]"
XPATH_VENUE = "//*[@id='data_table']/table/tbody/tr/td[2]"
XPATH_SEAT = "//*[@id='data_table']/table/tbody/tr/td[3]"
XPATH_PRICE = "//*[@id='data_table']/table/tbody/tr/td[4]"
NAME_CREDIT_CARD_TYPE = 'cc_type'
NAME_CREDIT_CARD_NBR = 'cc_nbr'
NAME_CREDIT_CARD_EXP_YR = 'cc_exp_yr'
NAME_CREDIT_CARD_EXP_MO = 'cc_exp_mo'
NAME_BUY = 'buy'
ID_FEE = 'fee'
ID_TOTAL = 'total'

class TicketBuyPage < Page

  def artist
    @@browser.find_element(:xpath, XPATH_ARTIST).text
  end

  def venue
    @@browser.find_element(:xpath, XPATH_VENUE).text
  end

  def seat
    @@browser.find_element(:xpath, XPATH_SEAT).text
  end

  def price
    @@browser.find_element(:xpath, XPATH_PRICE).text
  end

  def pay_by_credit_card
    @@browser.find_element(:name, NAME_CREDIT_CARD_NBR).send_keys '1234123412341234'
    @@browser.find_element(:name, NAME_CREDIT_CARD_EXP_MO).send_keys '11'
    @@browser.find_element(:name, NAME_CREDIT_CARD_EXP_YR).send_keys '2015'
    @@browser.find_element(:name, NAME_BUY).click
  end

  def select_credit_card_type(credit_card_type)
    puts '******'
    puts credit_card_type
    puts '******'

    options = @@browser.find_elements(:id, ID_CREDIT_CARD_TYPE)
    options.each do |cc_type|
      puts cc_type.text
      if ('Visa' == cc_type.text)
        puts 'Clicked!'
        cc_type.click
        break
      end
    end
  end

  def fee
    @@browser.find_element(:id, ID_FEE).text
  end

  def total_price
    @@browser.find_element(:id, ID_TOTAL).text
  end

end