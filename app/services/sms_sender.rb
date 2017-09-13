class SmsSender
  attr_reader :client, :receiver, :sender

  def initialize(client: NexmoClientAdapter.build, sender: Rails.application.config.sms_sender_name, 
    receiver: Rails.application.config.sms_receiver_phone_number)
    @client = client
    @sender = sender
    @receiver = receiver
  end

  def send(message)
    client.send(
      sender: sender,
      receiver: receiver,
      message: message,
    )
  end
end