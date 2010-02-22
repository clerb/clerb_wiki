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
      subject.title = nil
      subject.should_not be_valid
    end

    it "can contain alpha numeric characters" do
      subject.title = "Abcd1234"
      subject.should be_valid
    end

    it "must start with a capital letter" do
      subject.title = "abcd1234"
      subject.should_not be_valid
    end

    it "cannot have punctuation" do
      subject.title = "abcd.1234"
      subject.should_not be_valid
    end

    it "cannot have white space" do
      subject.title = "Abcd 1234"
      subject.should_not be_valid
    end

  end

end
