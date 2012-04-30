class Job::Download < Job::Base

  attr :output_dir, :media_ids

  def initialize output_dir, media_ids, options = {}
    super(options)
    @output_dir = output_dir
    @media_ids = media_ids
  end

end

