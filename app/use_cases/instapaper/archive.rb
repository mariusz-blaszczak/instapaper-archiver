module Instapaper
  class Archive
    attr_accessor :notifier, :archiver, :report_generator

    def initialize(notifier: SmsNotifier.new, archiver: InstapaperCrawler.new, 
                   report_generator: ReportGenerator.new)
      @notifier = notifier
      @archiver = archiver
      @report_generator = report_generator
    end

    def call
      return unless valid_date?
      archiver.subscribe(report_generator)
      result = archiver.archive_all_articles
      result.on_success do |message|
        notifier.send(report_generator.message)
      end
    end

    def valid_date?
      Time.now.saturday?
    end
  end
end