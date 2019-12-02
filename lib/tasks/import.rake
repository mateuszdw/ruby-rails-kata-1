require "csv"

namespace :import do

  desc "Import data from CSV"
  task :csv => :environment do
    puts "--> Start import"
    ActiveRecord::Base.transaction do
      Author.from_csv("#{Rails.root.to_s}/data/authors.csv")
      Publication.from_csv("#{Rails.root.to_s}/data/books.csv", :book)
      Publication.from_csv("#{Rails.root.to_s}/data/magazines.csv", :magazine)
    end
    puts "--> Imported!"
  end
end
