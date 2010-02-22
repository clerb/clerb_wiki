Given /^a wiki document titled "([^\"]*)" with body "([^\"]*)"$/ do |title, body|
  WikiDocument.create! :title => title, :body => body
end

When /^I visit the wiki page for "([^\"]*)"$/ do |document_title|
  visit "/wiki/%s" % [document_title]
end
