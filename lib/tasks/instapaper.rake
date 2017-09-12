namespace :instapaper do
  desc "Archives all current articles on users profile of instapaper"
  task archive: :environment do
    result = Instapaper::Archive.new.call
    result.on_success { |message| puts message }
  end
end
