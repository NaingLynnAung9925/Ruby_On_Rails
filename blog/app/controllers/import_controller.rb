require 'rubyXL'
class ImportController < ApplicationController


  def index
    @products = Import.all
     respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }

     end
    
  end

  def import_file
  
    # sample = Import.import_file(params[:file] )
    workbook = RubyXL::Parser.parse(params[:file])
    puts workbook.worksheets[0]
    #render 'import_show'
  end



# @file_name = params[:file].original_filename
#    @arr = @file_name.split(".")
#    if(@arr.last == 'csv' || @arr.last == 'xlx' || @arr.last == 'xlsx' || @arr.last == 'doc' || @arr.last == 'docx')
#end

end
