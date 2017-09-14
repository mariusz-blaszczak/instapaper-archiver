module InstapaperTestSupport
  class ArticleCounter
    def call
      puts "Loggin in to Instapaper dashboard..."
      login
      puts "Logged in to Instapaper dashboard..."
      count_articles
    end

    private

    def count_articles
      browser.elements(class: "article_item").size
    end

    def login
      username = Rails.application.secrets.fetch(:instapaper_login)
      password = Rails.application.secrets.fetch(:instapaper_password)

      browser.goto("https://www.instapaper.com/")
      browser.link(text: "Sign In").click
      browser.text_field(id: "sign_in_modal_email").set(username)
      browser.text_field(id: "password").set(password)
      puts "Click login button..."
      browser.button(text: "Sign In").click
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


describe InstapaperTestSupport::ArticleCounter do
  it "count articles number" do
    described_class.new.call
  end
end
