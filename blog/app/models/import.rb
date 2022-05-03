class Import < ActiveRecord::Base
  def self.to_csv(options = {})
    
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end


  def self.import_file(file)

    case File.extname(file.original_filename)
      when '.csv' then CSV.read(file.path)
      when '.xls' then Roo::Excelx.new(file.path)
      when '.xlsx'then Roo::Excelx.new(file.path)
      when '.txt' then File.read(file.path)
      when '.docx'then Docx::Document.open(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end

  end

end