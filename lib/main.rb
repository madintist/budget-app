# frozen-string-literal: true

require_relative './app_option_parser'
require_relative './budget_app'

parser = AppOptionParser.new
parser.parse ARGV

if parser.options[:load]
  BudgetApp.new parser.options[:load]
elsif parser.options[:init]
  BudgetApp.new
end

exit
