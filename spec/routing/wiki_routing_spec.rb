require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WikiController, "routing" do

  specify { wiki_path("Foo").should == "/wiki/Foo" }
  
  specify { wiki_path(WikiDocument.create!(:title=>"FooBar")).should match /\/wiki\/(\d)+/ }
  
  specify { wiki_path(1).should == "/wiki/1" }

  specify { route_for(:controller => "wiki",
                      :action => "show",
                      :title => "Foo").should == "/wiki/Foo" }

  specify { params_from(:get, "/wiki/Foo").should == { :controller => "wiki",
                                                       :action => "show",
                                                       :title => "Foo" } }

end
