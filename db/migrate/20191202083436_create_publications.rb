class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.string :isbn
      t.datetime :published_at
      t.integer :publication_type

      t.timestamps
    end
    add_index :publications, :isbn, unique: true
    add_index :publications, [:title], order: {title: :asc}
  end
end
