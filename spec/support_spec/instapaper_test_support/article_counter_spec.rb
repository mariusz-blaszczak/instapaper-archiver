require "rails_helper"

describe InstapaperTestSupport::ArticleCounter do
  it "count articles number" do
    described_class.new.call
  end
end
