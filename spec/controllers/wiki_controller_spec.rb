require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WikiController do
  integrate_views

  describe "#show" do

    before do
      get :show, :title => "Foo"
    end

    specify { response.should render_template('show') }

  end

end
