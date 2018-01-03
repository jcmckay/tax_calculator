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

  current = TaxCalculator.new(bracket_name:"current").calc_taxes(args[:income].to_f)
  final   = TaxCalculator.new(bracket_name:"final").calc_taxes(args[:income].to_f)
  puts ""
  puts "(2017) Current Taxes:                         $#{current}"
  puts "(2018) Tax Cuts and Jobs Act Taxes:           $#{final}"
  puts "       Total Savings:                         $#{(current - final).round(2)}"
  puts ""

end
