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
      to: '+19499230368',
      from: '+19493572945'
      )
    rescue Twilio::REST::RequestError => error
      puts error.message
    end

    redirect_to root_path
  end

  private

  def init_client
    account_sid = 'AC020fb6e87eedfc9a5f8cd22f06f7386f'
    auth_token = '94e61834103b06cb9d593d66223424ea'

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

end
