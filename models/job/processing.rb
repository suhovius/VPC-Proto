class Job::Processing < Job::Base

  attr :input_files_array, :output_dir

  def initialize input_files_array, output_dir, options = {}
    raise "Can't initialize an abstract class instance" if self.class == Job::Processing
    super(options)
    @input_files_array = input_files_array
    @output_dir = output_dir
  end

end

