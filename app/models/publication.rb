class Publication < ApplicationRecord
  has_and_belongs_to_many :authors

  enum publication_type: [:book, :magazine]

  def self.from_csv(path, pub_type)
    CSV.foreach(path, {col_sep: ';', headers: true, header_converters: :symbol}) do |row|
      authors = Author.where(email: row[:authors].split(","))
      Publication.create!(
        title: row[:title],
        description: row[:description],
        isbn: row[:isbn],
        published_at: row[:published_at],
        authors: authors,
        publication_type: pub_type
      )
    end
  end
end
