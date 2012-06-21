desc 'Create test fixtures from existing data in the database to a YAML file.
By default uses development database. Set RAILS_ENV to override'

task :extract_fixtures => :environment do
  sql = "SELECT * FROM %s"
  skip_tables = ["schema_migrations"]
  ActiveRecord::Base.establish_connection
  (ActiveRecord::Base.connection.tables - skip_tables).each do |table_name|
    i = "0000"
    File.open("#{Rails.root}/test/fixtures/#{table_name}.yml", "w") do |file|
      data = ActiveRecord::Base.connection.select_all(sql % table_name)
      file.write data.inject({}) { |hash, record|
        hash["#{table_name}_#{i.succ!}"] = record
        hash
      }.to_yaml
    end
  end
end