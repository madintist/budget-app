# frozen-string-literal: true

require_relative './constants'

# All the options for this app are defined here
module AppOptions
  def self.help(parser)
    parser.on('-h', '--help', 'Print this help.') do
      puts parser
      exit
    end
  end

  def self.version(parser)
    parser.on('-v', '--version', 'Print the app version.') do
      puts VERSION
      exit
    end
  end
end
