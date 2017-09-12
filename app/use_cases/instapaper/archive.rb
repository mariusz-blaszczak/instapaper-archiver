module Instapaper
  class Archive
    def call
      config_agent
      login
    end

    def login
      login_page = agent.get(@admin_url)
      login_form = login_page.forms.first
      login_field = login_form.field_with(name: "login")
      password_field = login_form.field_with(name: "password")
      login_field.value = @username
      password_field.value = @password
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