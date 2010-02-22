class WikiDocument < ActiveRecord::Base
  validates_presence_of :title
  validates_format_of :title, :with => /^[A-Z][A-z0-9]*$/

  after_save :create_document_version

  has_many :versions, :dependent => :destroy, :class_name => 'WikiDocumentVersion' do
    def number version_number
      self.first(:conditions => {:version => version_number})
    end
  end

  def to_param; title; end

private

  def create_document_version
    WikiDocumentVersion.create_from_wiki_document self
  end

end
