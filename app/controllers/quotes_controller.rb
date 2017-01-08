class QuotesController < ApplicationController
  def index
    Giphy::Configuration.configure do |config|
      config.api_key = 'dc6zaTOxFJmzC'
    end

    @image = Giphy.random('zoolander')
  end

  def send_text
    init_client

    random_id = rand(ZoolanderQuote.first.id..ZoolanderQuote.last.id)
    message = ZoolanderQuote.find(random_id).body

    begin
      @client.messages.create(
      body: message,
      to: '+1' + params[:phone_number],
      from: "+" + ENV['TWILIO_NUM']
      )
    rescue Twilio::REST::RequestError => error
      puts error.message
    end

    redirect_to root_path
  end

  private

  def init_client
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end

end
