module Instapaper
  class Archive
    def call
      return unless Time.now.saturday?
      
      result = ::InstapaperCrawler.new.archive_all_articles
      result.on_success do |message|
        sender = SmsNotifier.new
        sender.send(message)
      end
    end
  end
end