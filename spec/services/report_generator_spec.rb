require "rails_helper"

describe ReportGenerator do

  describe "#message" do

  end

  describe "#archive_first_article_from_the_top" do
    subject { described_class.new }
    it "increment the archived_count by 1" do
      expect { subject.archive_first_article_from_the_top }.to change { subject.archived_count }.by(+1)
    end
  end
end