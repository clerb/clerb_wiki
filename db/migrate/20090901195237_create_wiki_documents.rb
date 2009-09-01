class CreateWikiDocuments < ActiveRecord::Migration
  def self.up
    create_table :wiki_documents do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :wiki_documents
  end
end
