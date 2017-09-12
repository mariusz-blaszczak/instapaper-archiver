module Instapaper
  class Archive
    def call
      login
    end

    def login
      agent.goto("https://www.instapaper.com/")
      agent.link(text: "Sign In").click
      agent.text_field(id: "sign_in_modal_email").set(Rails.application.secrets.fetch(:instapaper_login))
      agent.text_field(id: "password").set(Rails.application.secrets.fetch(:instapaper_password))
      agent.button(text: "Sign In").click

      while agent.link(class: "js_archive_single action_link").exists? == true do
        binding.pry
        agent.link(class: "js_archive_single action_link").click
      end
    end
    
    def agent
      @agent ||= Watir::Browser.new
    end
  end
end