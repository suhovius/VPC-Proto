class Job::Concatenize < Job::Processing

  def perform
    new_file_path = "#{self.output_dir}/#{SecureRandom.uuid}.txt"
    File.open(new_file_path, "a") do |new_file|
      self.input_files_array.each do |file_path|
        File.open(file_path) do |file|
          new_file.write file.read
        end
      end
    end
    [new_file_path]
  end

end

