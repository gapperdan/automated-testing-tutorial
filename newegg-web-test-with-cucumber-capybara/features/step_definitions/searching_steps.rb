When /^I search for (.*)$/ do |search_term|
  @homepage = PageModule::HomePage.new
  @search_result_page = @homepage.search(search_term)
end

Then /^I should see a list of products related to (.*)$/ do |search_term|
  @search_result_page.result.each do |link|
    #puts link.text
    link.text.should include search_term #each link should contain the search_term text
  end
end
