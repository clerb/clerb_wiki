require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WikiController do
  integrate_views

  describe "#show" do

    before do
      @wiki_document = stub(:title => "Foo", :body => "Lorem ipsum...")
      WikiDocument.stubs(:find_by_title).with("Foo").returns(@wiki_document)

      get :show, :title => "Foo"
    end

    specify { response.should render_template('show') }
    specify { assigns[:wiki_document].should == @wiki_document }

  end

end
