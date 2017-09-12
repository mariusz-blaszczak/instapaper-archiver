module Instapaper
  class Archive
    def call
      config_agent
      login
      dashboard = agent.get("https://www.instapaper.com/u")
      binding.pry
    end

    def login
      login_page = agent.get("https://www.instapaper.com/")
      login_form = login_page.forms.first
      login_field = login_form.field_with(name: "username")
      password_field = login_form.field_with(name: "password")
      login_field.value = Rails.application.secrets.fetch(:instapaper_login)
      password_field.value = Rails.application.secrets.fetch(:instapaper_password)
      login_form.click_button
    end
    
    def agent
      @agent ||= Mechanize.new
    end

    def config_agent
      agent.user_agent_alias = "Mac Safari"
      agent.follow_meta_refresh = true
      agent.redirect_ok = true
    end

  end
end