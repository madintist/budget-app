# frozen-string-literal: true

require_relative './app_option_parser'
require_relative './budget_app'

# Hi!
class Main
  attr_reader :app

  def initialize
    @parser = AppOptionParser.new
    @parser.parse ARGV

    if @parser.options[:load]
      @app = BudgetApp.new @parser.options[:load]
    elsif @parser.options[:init]
      @app = BudgetApp.new
    else
      # TODO: Make this better
      puts 'You must either load a budget or init a new one.'
      exit
    end

    return unless @parser.options[:add_account] && @app

    @app.add_account @parser.options[:add_account]
  end
end

Main.new

exit
