Given /^I am a logged in administrator$/ do
  visit "/wiki/new"
end

When /^I create a document$/ do
  fill_in :wiki_document_title, :with=> "Foo"
  fill_in :wiki_document_body, :with=>"bar"
  click_button "Create Document"
end

Then /^document is published on the homepage$/ do
  visit "/"
  response_body.should contain "Foo"
end

Given /^a document that I have authored in the past exists$/ do
  WikiDocument.create! :title=>"My love", :body=>"Is bacon."
end

When /^I edit the document$/ do
  visit edit_wiki_path(WikiDocument.find_by_title("My love"))
  fill_in :wiki_document_body, :with=>"Is Still Bacon."
  click_button "Update Document"
end

Then /^the latest version is published on the homepage$/ do
  response_body.should contain "Is Still Bacon."
end
