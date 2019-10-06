namespace :ridgepole do
  desc "Apply ridgepole schemafile"
  task apply: :environment do
    ridgepole('--apply')
  end

  desc "Export ridgepole schemafile"
  task export: :environment do
    ridgepole('--export')
  end

  desc "seed"
  task seed: :environment do
    admin = Administrator.new(login_id: 'test', password: 'test123')
    admin.save!
  end

  private

  def ridgepole(*options)
    command = ['bundle exec ridgepole --file db/schemas/Schemafile', "-c config/database.yml", "-E #{Rails.env}"]
    system (command + options).join(' ')
  end


end