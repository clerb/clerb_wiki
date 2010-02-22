require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WikiDocument do

  before do
    @wiki_document = WikiDocument.new(:title => "MyDocument",
                                      :body => "Lorem ipsum...")
  end

  subject { @wiki_document }

  it { should be_valid }

  describe "#to_param" do
    it "delegates to title" do
      subject.to_param.should == subject.title
    end
  end

  describe "#title" do
    it "is required" do
      @wiki_document.title = nil
      @wiki_document.should_not be_valid
    end

    it "can contain alpha numeric charaters" do
      @wiki_document.title = "ABCD1234"
      @wiki_document.should be_valid
    end

    it "must start with a capital letter" do
      @wiki_document.title = "abcd1234"
      @wiki_document.should_not be_valid
    end

    it "cannot have punctuation" do
      @wiki_document.title = "Abcd.1234"
      @wiki_document.should_not be_valid
    end

    it "cannot have white space" do
      @wiki_document.title = "Abcd 1234"
      @wiki_document.should_not be_valid
    end
  end

  describe "#title" do
    it "is required"
    it "can contain alpha numeric characters"
    it "must start with a capital letter"
    it "cannot have punctuation"
    it "cannot have white space"
  end

end
