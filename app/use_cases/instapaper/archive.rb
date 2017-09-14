module Instapaper
  class Archive
    attr_reader :notifier, :archiver

    def initialize(notifier: SmsNotifier.new, archiver: InstapaperCrawler.new)
      @notifier = notifier
      @archiver = archiver
    end

    def call
      return unless Time.now.saturday?
      result = archiver.archive_all_articles
      result.on_success do |message|
        notifier.send(message)
      end
    end
  end
end