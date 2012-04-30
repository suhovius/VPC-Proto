class Job::Download < Job::Base

  def initialize encoding_id, work_dir, media_ids = []
    @encoding_id = encoding_id
    @media_ids = media_ids
    make_work_dir!
  end

  def work_dir_fullpath
    "#{self.processing_folder}/#{self.wokr_dir}"
  end

  def download

  end



end

