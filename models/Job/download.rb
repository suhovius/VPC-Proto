class Job::Download

  def initialize encoding_id, work_dir, media_ids = []
    @encoding_id = encoding_id
    @media_ids = media_ids
  end

  def work_dir_fullpath
  end

  private

    def make_work_dir!
      Dir.mkdir(TMPFILES_DIR) unless File.directory? TMPFILES_DIR
      Dir.mkdir(self.processing_folder) unless File.directory? self.processing_folder
      Dir.mkdir(self.processing_folder) unless File.directory? self.processing_folder
    end

end

