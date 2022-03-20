task :app do
    require './app'
end

task :db_create do
    ruby "./db/migrations/create_tables.rb"
end

task :db_drop do
    ruby "./db/migrations/drop_tables.rb"
end

task :db_seed do
    ruby "./db/data/seed.rb"
end
