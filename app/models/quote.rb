class Quote < ActiveRecord::Base
  def self.init_client
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end

  def self.create_text(number)
    self.init_client

    @client.messages.create(
      body: ZoolanderQuote.random,
      to: '+1' + number,
      from: "+" + ENV['TWILIO_NUM']
      )
  end

end
