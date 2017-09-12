module Instapaper
  class Archive


    def call
      @archived_count = 0
      login
      archive_all
      Resonad.Success(message)
    end

    def message
      "#{@archived_count} articles just has been archived!"
    end

    def login
      username = Rails.application.secrets.fetch(:instapaper_login)
      password = Rails.application.secrets.fetch(:instapaper_password)

      browser.goto("https://www.instapaper.com/")
      browser.link(text: "Sign In").click
      browser.text_field(id: "sign_in_modal_email").set(username)
      browser.text_field(id: "password").set(password)
      browser.button(text: "Sign In").click
    end

    def archive_all
      while is_there_more? do
        archive_first_article_from_the_top
        wait_for_animation_of_deleting
        @archived_count += 1
      end
    end

    def wait_for_animation_of_deleting
        sleep(2)
    end

    def archive_first_article_from_the_top
      browser.link(class: %w(js_archive_single action_link)).click
    end

    def is_there_more?
      browser.link(class: %w(js_archive_single action_link)).exists?
    end
    
    def browser
      @browser ||= new_browser
    end

    def new_browser
      options = Selenium::WebDriver::Chrome::Options.new

      # make a directory for chrome if it doesn't already exist
      chrome_dir = File.join Dir.pwd, %w(tmp chrome)
      FileUtils.mkdir_p chrome_dir
      user_data_dir = "--user-data-dir=#{chrome_dir}"
      # add the option for user-data-dir
      options.add_argument user_data_dir

      # let Selenium know where to look for chrome if we have a hint from
      # heroku. chromedriver-helper & chrome seem to work out of the box on osx,
      # but not on heroku.
      if chrome_bin = ENV["GOOGLE_CHROME_BIN"]
        options.add_argument "no-sandbox"
        options.binary = chrome_bin
        # give a hint to here too
        Selenium::WebDriver::Chrome.driver_path = \
          "/app/vendor/bundle/bin/chromedriver"
      end

      # headless!
      # keyboard entry wont work until chromedriver 2.31 is released
      options.add_argument "window-size=1200x600"
      options.add_argument "headless"
      options.add_argument "disable-gpu"

      # make the browser
      Watir::Browser.new :chrome, options: options
      end
  end
end