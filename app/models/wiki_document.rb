class WikiDocument < ActiveRecord::Base
  validates_presence_of :title

  def to_param; title; end
end
