require "rails_helper"

describe ReportGenerator do
  subject { described_class.new }

  describe "#message" do
    it "prints report including current archived_count" do
      subject.archived_count = 5
      expect(subject.message).to eq("Whoaa! 5 articles just has been archived in your Instapaper!")
    end
  end

  describe "#archive_first_article_from_the_top" do
    
    it "increment the archived_count by 1" do
      expect { subject.archive_first_article_from_the_top }.to change { subject.archived_count }.by(+1)
    end
  end
end