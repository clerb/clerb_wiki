require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WikiController, "routing" do

  specify { wiki_path("Foo").should == "/wiki/Foo" }

  specify { route_for(:controller => "wiki",
                      :action => "show",
                      :title => "Foo").should == "/wiki/Foo" }

  specify { params_from(:get, "/wiki/Foo").should == { :controller => "wiki",
                                                       :action => "show",
                                                       :title => "Foo" } }

end
