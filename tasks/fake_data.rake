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
  end
end

