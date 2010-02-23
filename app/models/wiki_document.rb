class WikiDocument < ActiveRecord::Base
  validates_presence_of :title
  validates_format_of :title, :with => /^[A-Z][A-z0-9]*$/

  def to_param; title; end
end
