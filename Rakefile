# This Rakefile has all the right settings to run the tests inside each chapter
gem 'rspec'
gem 'guard-rspec', require: false

require 'rspec/core/rake_task'

task :default => :spec

desc "run tests for this chapter"
RSpec::Core::RakeTask.new do |task|
  chapter = Rake.application.original_dir
  task.pattern = "*_spec.rb"
  task.rspec_opts = [ "-I#{chapter}", "-I#{chapter}/solution", '-f documentation', '-r ./rspec_config', '--color']
  task.verbose = false
end

require './calc.rb'
require './tax_brackets.rb'

desc "compare tax 'savings'"
task :calc_tax, [:income] do |task, args|
  puts "Current: #{TaxCalculator.new(bracket_name:"current").calc_taxes(args[:income].to_f)}"
  puts "House:   #{TaxCalculator.new(bracket_name:"house").calc_taxes(args[:income].to_f)}"
  puts "Senate:  #{TaxCalculator.new(bracket_name:"senate").calc_taxes(args[:income].to_f)}"

end
