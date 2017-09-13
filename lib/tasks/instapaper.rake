namespace :instapaper do
  desc "Archives all current articles on users profile of instapaper"
  task archive: :environment do
    if !Time.now.saturday?
      puts "Today is not the right day for archiving. Articles haven't been sent yet"
      next
    end
    result = Instapaper::Archive.new.call
    
    result.on_success do |message|
      report_sender = ReportSender.build
      report_sender.send(message)
    end
  end
end
