# initialize the db seeds for CloudFoundry
if Yamadb.cloud_foundry?
  load File.join(Rails.root,'Rakefile')
  Rake::Task['db:seed'].invoke
end
