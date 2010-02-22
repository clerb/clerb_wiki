class AddVersionNumberToWikiDocument < ActiveRecord::Migration
  def self.up
    create_table :wiki_document_versions do |t|
      t.integer :version
      t.integer :wiki_document_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :wiki_documents
  end
end
