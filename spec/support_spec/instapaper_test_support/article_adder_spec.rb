require "rails_helper"

describe InstapaperTestSupport::ArticleAdder do
  it "add url to instapaper account" do
    response = described_class.new.call("https://github.com/stve/instapaper")
    key = JSON.parse(response.body).keys.first
    expect(key).to eq("bookmark_id")
  end
end
