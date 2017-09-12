module Instapaper
  class Archive
    def call
      login
    end

    def login
      browser.goto("https://www.instapaper.com/")
      browser.link(text: "Sign In").click
      browser.text_field(id: "sign_in_modal_email").set(Rails.application.secrets.fetch(:instapaper_login))
      browser.text_field(id: "password").set(Rails.application.secrets.fetch(:instapaper_password))
      browser.button(text: "Sign In").click

      while is_there_more? do
        browser.link(class: %w(js_archive_single action_link)).click
        sleep(2)
      end
    end

    def is_there_more?
      browser.link(class: %w(js_archive_single action_link)).exists?
    end
    
    def browser
      @browser ||= Watir::Browser.new
    end
  end
end