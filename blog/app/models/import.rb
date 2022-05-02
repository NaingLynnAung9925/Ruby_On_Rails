class Import < ActiveRecord::Base
  def self.to_csv(options = {})
    
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

#def self.import_file(file)
#  spreadsheet = open_spreadsheet(file)
#  header = spreadsheet.row(1)
#  (2..spreadsheet.last_row).each do |i|
#    row = Hash[ [header, spreadsheet.row(i)].transpose]
#    product = find_by_id(row["id"]) || new
#    product.attributes = row.to_hash.slice(*row.to_hash.keys)
#    product.save!
#  end
#end


def self.import_file(file)


    case File.extname(file.original_filename)
      when '.csv' then CSV.read(file.path)
      when '.xls' then Roo::Spreadsheet.open(file.path)
      when '.xlsx'then RubyXL::Parser.parse(file.path)
      when '.txt' then File.read(file.path)
      when '.docx'then Docx::Document.open(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end

end


#def self.open_docx(file)
#  Import.open(params[:file])
#end
#
#
#def self.open(file)
#  case File.extname(file.original_filename)
#    when '.csv' then CSV.read(file.path)
#    when '.txt' then File.read(file.path)
#    when '.docx'then Docx::Document.open(file.path)
#    else raise "Unknown file type: #{file.original_filename}"
#    end
#end



  # CSV.foreach(file.path, headers: true) do |row|
  # import_hash = row.to_hash
  # import = find_or_create_by!(number: import_hash['number'], footnote: import_hash['footnote']) || new
  # import.save!
  # end



end