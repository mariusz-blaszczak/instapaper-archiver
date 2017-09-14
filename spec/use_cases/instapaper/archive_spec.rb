require "rails_helper"

describe Instapaper::Archive do
  let(:notifier) do
    notifier = instance_double(SmsNotifier)
    allow(notifier).to receive(:send)
    notifier
  end

  context "on archivization success" do
    let(:sample_saturyday) { Time.new(2017, 9, 2) }
    before { Timecop.freeze(sample_saturyday) }
    after { Timecop.return }

    let(:archiver) do
      archiver = instance_double(InstapaperCrawler)
      allow(archiver).to receive(:archive_all_articles) { Resonad::Success("A sample message") }
      archiver
    end

    subject { described_class.new(notifier: notifier, archiver: archiver).call }

    it "calls send on notifier" do
      expect(notifier).to receive(:send).with("A sample message")
      subject
    end
  end

  context "on other day than saturyday" do
    let(:sample_sunday) { Time.new(2017, 9, 3) }
    before { Timecop.freeze(sample_sunday) }
    after { Timecop.return }

    let(:archiver) do
      archiver = instance_double(InstapaperCrawler)
      allow(archiver).to receive(:archive_all_articles) { Resonad::Success("A sample message") }
      archiver
    end

    subject { described_class.new(notifier: notifier, archiver: archiver).call }


    it "does not call archive_all_articles on archiver" do
      expect(archiver).to_not receive(:archive_all_articles)
      subject
    end
  end
end
