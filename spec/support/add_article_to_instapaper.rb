module InstapaperTestSupport
  class ArticleAdder
    def initialize
    end

    def call
      api_url = "https://www.instapaper.com/api/add"
      RestClient.post(api_url, request_params)
    end

    def request_params
      {
        username: Rails.application.secrets.fetch(:instapaper_login),
        password: Rails.application.secrets.fetch(:instapaper_password),
        url: "https://robots.thoughtbot.com/deadlines"
      }
    end
  end

  class ArticleCounter
    def call
    end
  end
end


describe InstapaperTestSupport::ArticleAdder do
  it "add url to instapaper account" do
    described_class.new.call
  end
end
