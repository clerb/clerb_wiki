require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WikiDocumentVersion do

  before do
    @document = WikiDocument.create(
      :title => "MyDocument",
      :body => "Lorem ipsum...")
    @version = WikiDocumentVersion.create_from_wiki_document(@document)
  end

  subject { @version }

  it { should be_valid }

  describe "#version" do
    it "is required" do
      @version.version = nil
      @version.should_not be_valid
    end

    it "is unique for each wiki document id" do
      @version1 = WikiDocumentVersion.new :version => 2, :wiki_document_id => 1
      @version1.save(false)
      @version2 = WikiDocumentVersion.new :version => 3, :wiki_document_id => 1
      @version2.valid?
      @version2.errors[:version].should be_nil
      @version2.version = 2; @version2.valid?
      @version2.errors[:version].should_not be_nil
    end
  end

  describe "#wiki_document" do
    it "belongs to" do
      @wiki_document = WikiDocument.new
      @version.wiki_document = @wiki_document
      @version.wiki_document.should == @wiki_document
    end
  end

  describe "self.create_from_wiki_document" do
    before do
      @wiki_document = WikiDocument.create(:title => "MyDocument",
                                           :body => "Lorem ipsum...")
      @version = WikiDocumentVersion.create_from_wiki_document(@wiki_document)
    end

    subject { @version }

    it "copies over the title" do
      subject.title.should == @wiki_document.title
    end

    it "copies over the body" do
      subject.body.should == @wiki_document.body
    end

    it "has a version number" do
      subject.version.should_not be_nil
    end

    it "belongs to that wiki document" do
      subject.wiki_document.should == @wiki_document
    end

    it "increments for the next version number" do
      @version2 = WikiDocumentVersion.create_from_wiki_document(@wiki_document)
      @version2.version.should == subject.version + 1
    end
  end

end
