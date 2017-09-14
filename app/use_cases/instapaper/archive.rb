module Instapaper
  class Archive
    attr_reader :notifier, :archiver

    def initialize(notifier: SmsNotifier.new, archiver: InstapaperCrawler.new)
      @notifier = notifier
      @archiver = archiver
    end

    def call
      return unless valid_date?
      result = archiver.archive_all_articles
      result.on_success do |message|
        notifier.send(message)
      end
    end

    def valid_date?
      Time.now.saturday?
    end
  end
end