class Conveyor

  @@jobs_results = {}

  @@create_medias_for_jobs = []

  class << self
    def perform(encoding_id)
      encoding = Encoder.find encoding_id
      storage = TempStorage.new encoding_id, "downloads"
      download = Job::Download.new storage.output_dir_fullpath, encoding.input_media_ids
      add_job_result :download, download.perform

      encoding.profile.commands.asc(:ordering_number).each do |command|
        processing_job = initiate_job_by command, encoding
        add_job_result command.ordering_number, processing_job.perform
        @@create_medias_for_jobs << processing_job if command.create_media
      end

  #    @@create_medias_for_jobs.each do |job|
  #      job.create_medias
  #    end

      # TODO delete tmpfiles
    end

    def add_job_result(job_number, result)
      @@jobs_results.[]= job_number, result
    end

    def set_input_data_for command
      input_number = command.input_from_command_with_number
      @@jobs_results[input_number ? input_number : :download]
    end

    def prepare_options_for command, params
      prepared_options = {}
      command.options.each do |option|
        value = (option.params_key_name && params[option.params_key_name]) ? params[option.params_key_name] : option.value
        prepared_options.[]= option.key.to_sym, value
      end
      prepared_options
    end

    def initiate_job_by command, encoding
      job_klass = "Job::#{command.job_name.camelize}".constantize
      storage = TempStorage.new encoding.id, command.ordering_number
      job_klass.new set_input_data_for(command), storage.output_dir_fullpath, prepare_options_for(command, encoding.params)
    end
  end

end

