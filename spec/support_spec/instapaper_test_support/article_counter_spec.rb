require "rails_helper"

describe InstapaperTestSupport::ArticleCounter do
  it "count articles number" do
    result = described_class.new.call
    expect(result).to eq(0)
  end
end
