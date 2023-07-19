require "bundler/setup"
require "flame"

require (Pathname.new(__FILE__).dirname + "../lib/flame").expand_path

Dir["./spec/support/*.rb"].sort.each { |file| require file }
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.expose_dsl_globally = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:suite) do
    Helper.remove_tmp_dir
  end

  config.before(:suite) do
    Helper.create_tmp_dir
  end
end
