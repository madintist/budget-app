# frozen-string-literal: true

require 'optparse'
require_relative './app_options'

# Load command line arguments and enable the correct options.
class AppOptionParser
  def parse(arguments)
    parser_instance = OptionParser.new do |parser|
      load_options parser
    end

    parser_instance.parse arguments
  end

  private

  def load_options(parser)
    AppOptions.help parser
  end
end
