class Job::Downloader < Job::Base

  attr :output_dir, :media_ids

  def initialize output_dir, media_ids, options = {}
    super(options)
    @output_dir = output_dir
    @media_ids = media_ids
  end

  def perform
    ordering_number = 0
    media_ids.each do |media_id|
      ordering_number += 1
      location = Media.find(media_id).location
      extension = File.extname location
      FileUtils.copy location, "#{self.output_dir}/#{ordering_number}#{extension}"
    end
    output_dir
  end

end

