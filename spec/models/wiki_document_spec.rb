require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WikiDocument do

  before do
    @wiki_document = WikiDocument.new(:title => "MyDocument", :body => "Lorem ipsum...")
  end

  subject { @wiki_document }

  it { should be_valid }

end
