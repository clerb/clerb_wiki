Given /^a wiki document titled "([^\"]*)" with body "([^\"]*)"$/ do |title, body|
  WikiDocument.create! :title => title, :body => body
end
