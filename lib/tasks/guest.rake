namespace :guest do
  desc 'Sweep expired guests (24H)'
  task :sweep => :environment do
    Guest.sweep
  end
end
