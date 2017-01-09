class ZoolanderQuote < ActiveRecord::Base

  def self.random
    random_id = rand(ZoolanderQuote.first.id..ZoolanderQuote.last.id)
    ZoolanderQuote.find(random_id).body
  end

end
