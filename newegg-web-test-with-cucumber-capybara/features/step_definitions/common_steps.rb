HOMEPAGE_TITLE = 'Newegg.com - Computer Parts, Laptops, Electronics, and More!'
HOMEPAGE_URL = 'http://www.newegg.com'

Given(/^I open the browser and go to Newegg homepage$/) do
  @homepage = PageModule::HomePage.new
  .open(HOMEPAGE_URL)
  .title == HOMEPAGE_TITLE
end