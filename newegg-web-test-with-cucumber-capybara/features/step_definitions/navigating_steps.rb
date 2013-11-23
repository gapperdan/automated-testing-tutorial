When /^I use the navigation menu and select the category (.*)$/ do |path|
  @path_array = path.split('>')
  @search_result_page = PageModule::HomePage.new.navigate(@path_array)
end

Then /^I should be on the (.*) page$/ do |category|
  @search_result_page.title.should == category
end