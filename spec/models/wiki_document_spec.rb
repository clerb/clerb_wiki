require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WikiDocument do

  before do
    @wiki_document = WikiDocument.new(:title => "MyDocument", :body => "Lorem ipsum...")
  end

  subject { @wiki_document }

  it { should be_valid }
  
  context "from scratch" do
    it "should have a title" do
      wd = WikiDocument.new
      wd.should_not be_valid
      wd.title = "Hello World"
      wd.should be_valid
    end
  end

end
