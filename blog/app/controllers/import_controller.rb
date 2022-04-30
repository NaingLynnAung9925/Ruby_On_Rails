class ImportController < ApplicationController


  def index
    @imports = Import.all
     respond_to do |format|
      format.html
      format.csv { send_data @imports.to_csv }

     end
  end

  def import_file
    #@file_name = params[:file].original_filename
    #@arr = @file_name.split(".")
    #if(@arr.last == 'csv')
    #  Import.import_file(params[:file])
    #end
    @names = Import.import_file(params[:file])
    render "import_show"

  end
end