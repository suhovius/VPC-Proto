module Job

  PROCESSING_DIR = "#{::TMPFILES_DIR}/encodings"

  attr :encoding_id, :options

  def initialize encoding_id, options = {}
    @encoding_id = encoding_id
    @options = options
    make_encoding_dir!
  end

  def encoding_dir_fullpath
    "#{PROCESSING_DIR}/#{self.encoding_id}"
  end

  private

    def make_encoding_dir!
      Dir.mkdir(PROCESSING_DIR) unless File.directory? PROCESSING_DIR
      Dir.mkdir(self.encoding_dir_fullpath) unless File.directory? self.encoding_dir_fullpath
    end

end

