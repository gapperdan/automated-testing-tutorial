HOMEPAGE_TITLE = 'Newegg.com - Computer Parts, Laptops, Electronics, and More!'

Given(/^I open the browser and go to Newegg homepage$/) do
  @homepage = PageModule::HomePage.new
    .open
    .title == HOMEPAGE_TITLE
end

When /^I search for (.*)$/ do |search_term|
  @homepage = PageModule::HomePage.new
  @result_list = @homepage.search(search_term)
end

Then /^I should see a list of products related to (.*)$/ do |search_term|
  @result_list.each do |link|
    #puts link.text
    link.text.should include search_term #each link should contain the search_term text
  end
end
