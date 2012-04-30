module Job
  def processing_folder
    "#{::TMP_FOLDER}/#{self.encoding_id}"
  end
end

