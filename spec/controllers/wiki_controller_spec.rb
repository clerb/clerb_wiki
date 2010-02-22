require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WikiController do
  integrate_views

  describe "#show" do

    before do
      @wiki_document = mock(:to_param => "Foo", :title => "Foo", :body => "Lorem ipsum...")
      WikiDocument.stub!(:find_by_title).with("Foo").and_return(@wiki_document)

      get :show, :id => "Foo"
    end

    specify { response.should render_template('show') }
    specify { assigns[:wiki_document].should == @wiki_document }

  end

end
