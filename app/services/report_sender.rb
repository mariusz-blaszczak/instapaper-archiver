class ReportSender
  attr_reader :sender, :message

  def initialize(sender: SmsSender.build)
    @sender = sender
  end

  def send(message)
    sender.send(message)
  end
end