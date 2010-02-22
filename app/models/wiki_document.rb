class WikiDocument < ActiveRecord::Base
  validates_presence_of :title
  validates_format_of :title, :format => /[a-z][A-Z]/

  def to_param; title; end
end
