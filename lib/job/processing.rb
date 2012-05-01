class Job::Processing < Job::Base

  MEDIA_TYPE = nil

  attr :input_files_array, :output_dir

  def initialize input_files_array, output_dir, options = {}
    raise "Can't initialize an abstract class instance" if self.class == Job::Processing
    super(options)
    @input_files_array = input_files_array
    @output_dir = output_dir
  end

  def create_medias
    raise "MEDIA_TYPE is not set" unless MEDIA_TYPE
    medias = []
    self.result_files.each do |file_path|
      extension = File.extname file_path
      new_file_path = "#{Padrino.root}/spec/fixtures/S3_bucket/results/#{SecureRandom.uuid}#{extension}"
      FileUtils.copy(location, new_file_path)
      medias << Media.create :type => MEDIA_TYPE, :location => new_file_path
    end
    medias
  end

end

