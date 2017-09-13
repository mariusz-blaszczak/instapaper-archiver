class SmsSender
  def self.build
    nexmo_key = Rails.application.secrets.fetch(:nexmo_key)
    nexmo_secret = Rails.application.secrets.fetch(:nexmo_secret)
    client = Nexmo::Client.new(key: nexmo_key, secret: nexmo_secret)
    new(client: client)
  end

  attr_reader :client

  SENDER_ID = "InstArchiver".freeze
  RECEIVER_PHONE_NUMBER = "+48887680333".freeze

  def initialize(client:)
    @client = client
  end

  def send(messege)
    
  end
end