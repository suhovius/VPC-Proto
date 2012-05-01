namespace :fake_data do
  task :medias => :environment do
    (1..3).each do |i|
      Media.create :location => "#{Padrino.root}/spec/fixtures/S3_bucket/#{i}.txt"
    end
  end

  task :profiles => :environment do
    profile = Profile.create :name => "Cool video"
    command = profile.commands.create :job_name => "concatenize", :ordering_number => 0
    option = command.options.create :key => "quality", :params_key_name => "quality_value"
    option = command.options.create :key => "test", :value => "123"
    command = profile.commands.create :job_name => "scale", :ordering_number => 1, :input_from_command_with_number => 0
    option = command.options.create :key => "resolution", :params_key_name => "resolution", :value => "640x480"
    command = profile.commands.create :job_name => "rotate", :ordering_number => 2, :input_from_command_with_number => 1
    option = command.options.create :key => "angle", :value => "90"
    option = command.options.create :key => "direction", :value => "left", :params_key_name => "direction"
  end

  task :encoders => :environment do
    media_ids = []
    (1..3).each do |i|
      media_ids << (Media.create :location => "#{Padrino.root}/spec/fixtures/S3_bucket/#{i}.txt").id
    end

    profile = create_profile
    encoder = Encoder.create(:input_media_ids => media_ids, :params => {"quality_value" => "high", "resolution" => "300x200"})
    encoder.profile = Profile.find profile.id
    encoder.save
  end


  def create_profile
    profile = Profile.create :name => "Cool video"
    command = profile.commands.create :job_name => "concatenize", :ordering_number => 0
    option = command.options.create :key => "quality", :params_key_name => "quality_value"
    option = command.options.create :key => "test", :value => "123"
    command = profile.commands.create :job_name => "scale", :ordering_number => 1, :input_from_command_with_number => 0
    option = command.options.create :key => "resolution", :params_key_name => "resolution", :value => "640x480"
    command = profile.commands.create :job_name => "rotate", :ordering_number => 2, :input_from_command_with_number => 1, :create_media => true
    option = command.options.create :key => "angle", :value => "90"
    option = command.options.create :key => "direction", :value => "left", :params_key_name => "direction"
    profile
  end

end

