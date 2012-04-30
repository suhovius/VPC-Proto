class Conveyor

  @@jobs_results = {}

  class << self
    def perform(encoding_id)
      encoding = Encoding.find encoding_id
      storage = TempStorage.new encoding_id, nil, "downloads"
      download = Job::Download.new storage.output_dir_fullpath, encoding.media_ids
      add_job_result :download, download.perform

    end

    def add_job_result(job_number, result)
      @@jobs_results.[]= (job_number, result)
    end
  end

end

