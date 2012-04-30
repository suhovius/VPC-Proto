namespace :fake_data do
  task :medias => :environment do
    (1..3).each do |i|
      Media.create :location => "#{Padrino.root}/spec/fixtures/S3_bucket/#{i}.txt"
    end
  end
end

