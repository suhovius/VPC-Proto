class Storage

  PROCESSING_DIR = "#{::TMPFILES_DIR}/encodings"

  attr :encoding_id, :input_dir_name, :output_dir_name

  def initialize encoding_id, input_dir_name = nil , output_dir_name = nil
    @encoding_id = encoding_id
    @input_dir_name = input_dir_name
    @output_dir_name = output_dir_name
    make_output_dir!
  end

  def encoding_dir_fullpath
    "#{PROCESSING_DIR}/#{self.encoding_id}"
  end

  def input_dir_fullpath
    "#{self.encoding_dir_fullpath}/#{self.input_dir_name}" if input_dir_name
  end

  def output_dir_fullpath
    "#{self.encoding_dir_fullpath}/#{self.output_dir_name}" if output_dir_name
  end

  private

    def make_output_dir!
      Dir.mkdir(PROCESSING_DIR) unless File.directory? PROCESSING_DIR
      Dir.mkdir(self.encoding_dir_fullpath) unless File.directory? self.encoding_dir_fullpath
      Dir.mkdir(self.output_dir_fullpath) unless File.directory? self.output_dir_fullpath if output_dir_name
    end
end

