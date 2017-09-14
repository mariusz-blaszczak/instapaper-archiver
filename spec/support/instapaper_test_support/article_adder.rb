module InstapaperTestSupport
  class ArticleAdder

    attr_reader :url

    def call(url)
      @url = url
      api_url = "https://www.instapaper.com/api/add"
      RestClient.post(api_url, request_params)
    end

    def request_params
      {
        username: Rails.application.secrets.fetch(:instapaper_login),
        password: Rails.application.secrets.fetch(:instapaper_password),
        url: url || "https://robots.thoughtbot.com/deadlines"
      }
    end
  end

  class ArticleCounter
    def call
    end
  end
end
