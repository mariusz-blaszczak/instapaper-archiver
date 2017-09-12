module Instapaper
  class Archive
    def call
      # config_agent
      login
      dashboard = agent.goto("https://www.instapaper.com/u")
      binding.pry
    end

    def login
      agent.goto("https://www.instapaper.com/")
      agent.link(text: "Sign In").click
      agent.text_field(id: "sign_in_modal_email").set(Rails.application.secrets.fetch(:instapaper_login))
      agent.text_field(id: "password").set(Rails.application.secrets.fetch(:instapaper_password))
      agent.button(text: "Sign In").click

      agent.link(class: "js_popover js_settings_popover top_button settings").click
      agent.link(class: "js_archive_all").click
    end
    
    def agent
      @agent ||= Watir::Browser.new
    end

    def config_agent
      agent.user_agent_alias = "Mac Safari"
      agent.follow_meta_refresh = true
      agent.redirect_ok = true
    end

  end
end