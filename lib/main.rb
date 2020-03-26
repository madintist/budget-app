# frozen-string-literal: true

require_relative './app_option_parser'
require_relative './budget_app'

parser = AppOptionParser.new
parser.parse ARGV

BudgetApp.new if parser.options[:init]

exit
