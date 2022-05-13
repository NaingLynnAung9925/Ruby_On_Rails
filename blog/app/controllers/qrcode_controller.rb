class QrcodeController < ApplicationController
  require "rqrcode"
  def create_qrcode

    if params[:input] != ""
      @input_data = params[:input]
      qr_code = RQRCode::QRCode.new("#{@input_data}")
      png = qr_code.as_png(
        color: "black",
        fill: "white",
        size: 300
      )
      qr_location = "./app/assets/images/#{@input_data}.png"
      @qr_image = "#{@input_data}.png"
      IO.binwrite(qr_location, png.to_s) 
      render "qr_show"
    else
      redirect_to '/tuto11/qrcode'
    end
  end
 
  def download
    qr_location = "./app/assets/images/#{@input_data}.png"
    send_data qr_location, type: 'image/png', disposition: 'attachment'
  end

end