class WikiDocumentVersion < ActiveRecord::Base
  validates_presence_of :version

  validates_uniqueness_of :version, :scope => :wiki_document_id

  belongs_to :wiki_document

  default_scope :order => 'version desc'

  def self.create_from_wiki_document document
    last_version = document.versions.first
    WikiDocumentVersion.create(
      :title => document.title,
      :body => document.body,
      :wiki_document => document,
      :version => last_version ? last_version.version + 1 : 1)
  end
end
