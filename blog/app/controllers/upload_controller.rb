class UploadController < ApplicationController
  
  def create_folder

    @folder_name = params[:folder]

    if @folder_name == nil
        redirect_to upload_path, notice: "File can't be empty"
    else

      @img_name = params[:image].original_filename

      if(Dir.exists?("./app/views/#{@folder_name}"))
        redirect_to upload_path, notice: "This Folder Name is Existing"

      else

        session[:folder_name] = @folder_name
        session[:img_name] = @img_name

        Dir.mkdir("./app/views/#{@folder_name}")

        File.open("./app/views/#{@folder_name}/#{@img_name}", "w") do |f|
          f.write params[:image]

        end

        render "show"

      end

    end

  end

end
