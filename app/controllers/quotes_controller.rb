class QuotesController < ApplicationController
  def index
    add_giphy
    @image = Giphy.random('zoolander')
  end

  def send_text
    init_client

    begin
      @client.messages.create(
      body: ZoolanderQuote.random,
      to: '+1' + params[:phone_number],
      from: "+" + ENV['TWILIO_NUM']
      )
      flash[:notice] = "Text sent!"
    rescue Twilio::REST::RequestError => error
      puts error.message
      flash[:notice] = "Something went wrong!"
    end

    redirect_to root_path
  end

  private

  def init_client
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end

  def add_giphy
    Giphy::Configuration.configure do |config|
      config.api_key = ENV['GIPHY_KEY']
    end
  end

end
