require "rails_helper"

describe InstapaperCrawler do
  subject { described_class.new }
  it "archives all articles" do
    InstapaperTestSupport::ArticleAdder.new.call("https://roweroweporady.pl/rowerowa-trasa-przemysl-bieszczady-lublin/")
    InstapaperTestSupport::ArticleAdder.new.call("https://roweroweporady.pl/skoda-ebike-test-roweru-elektrycznego/")
    articles_count = InstapaperTestSupport::ArticleCounter.new.call
    binding.pry
    expect(articles_count).to eq(2)
    subject.call
    articles_count_after_archive = InstapaperTestSupport::ArticleCounter.new.call
    expect(articles_count_after_archive).to eq(0)
  end
end
