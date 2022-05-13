class ImportController < ApplicationController

  def index

    @products = Import.all
     respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }

     end
  end

  def import_file

   if params[:file]
      @file_name = params[:file].original_filename
      @arr = @file_name.split(".")
      Import.import_file(params[:file] )
    render 'import_show'
   else
    render 'index'
   end
  end

end
