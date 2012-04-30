class Job::Processing < Job::Base

  attr :input_dir, :output_dir

  def initialize input_dir, output_dir, options = {}
    raise "Can't initialize an abstract class instance" if self.class == Job::Processing
    super(options)
    @input_dir = input_dir
    @output_dir = output_dir
  end

end

