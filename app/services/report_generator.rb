class ReportGenerator

  attr_accessor :archived_count

  def initialize
    @archived_count = 0
  end

  def archive_first_article_from_the_top
    @archived_count += 1
  end

  def message
    "Whoaa! #{@archived_count} articles just has been archived in your Instapaper!"
  end
end