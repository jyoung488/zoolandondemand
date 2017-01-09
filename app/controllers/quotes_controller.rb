class QuotesController < ApplicationController
  def index
    add_giphy
    @image = Giphy.random('zoolander')
  end

  def send_text
    flash[:notice] = "Sending text!"
    begin
      Quote.create_text(params[:phone_number])
    rescue Twilio::REST::RequestError => error
      puts error.message
      flash[:notice] = "Something went wrong!"
    end

    redirect_to root_path
  end

  private

  def add_giphy
    Giphy::Configuration.configure do |config|
      config.api_key = ENV['GIPHY_KEY']
    end
  end

end
