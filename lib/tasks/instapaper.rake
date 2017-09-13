namespace :instapaper do
  desc "Archives all current articles on users profile of instapaper"
  task archive: :environment do
    Instapaper::Archive.new.call
  end
end
