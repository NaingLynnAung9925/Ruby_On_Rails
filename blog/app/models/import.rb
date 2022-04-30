
class Import < ActiveRecord::Base
  attr_accessor :name, :age
  def self.to_csv(fields= column_names, options ={})

    CSV.generate(options) do |csv|
      csv << fields
      all.each do |import|
        csv << import.attributes.values_at(*fields)
      end
    end
  end

  def self.import_file(file)
    CSV.read(file.path)

  # CSV.foreach(file.path, headers: true) do |row|
  # import_hash = row.to_hash
  # import = find_or_create_by!(number: import_hash['number'], footnote: import_hash['footnote']) || new
  # import.save!
  # end
  end
end