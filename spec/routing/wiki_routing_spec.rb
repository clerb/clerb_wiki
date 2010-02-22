require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WikiController, "routing" do

  specify { wiki_document_path("Foo").should == "/wiki/Foo" }

  specify { wiki_document_path(WikiDocument.create!(:title=>"FooBar")).should match /\/wiki\/FooBar/ }

  specify { route_for(:controller => "wiki",
                      :action => "show",
                      :id => "Foo").should == "/wiki/Foo" }

  specify { params_from(:get, "/wiki/Foo").should == { :controller => "wiki",
                                                       :action => "show",
                                                       :id => "Foo" } }

end
