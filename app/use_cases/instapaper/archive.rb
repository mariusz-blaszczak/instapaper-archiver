module Instapaper
  class Archive
    include Browser

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
  end
end