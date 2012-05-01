class Job::Scale < Job::Processing

  MEDIA_TYPE = "video"

  def perform
    new_file_path = "#{self.output_dir}/#{SecureRandom.uuid}.txt"
    File.open(new_file_path, "a") do |new_file|
      file_path = self.input_files_array[0]
      File.open(file_path) do |file|
        new_file.write file.read
      end
      new_file.write "With options #{self.options}"
    end
    self.result_files = [new_file_path]
  end

end

