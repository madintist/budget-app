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

  def self.init(parser, options)
    parser.on('-i', '--init', 'Create a new budget database.') do
      options[:init] = true
    end
  end

  def self.load(parser, options)
    parser.on('-l', '--load DATABASE', 'Load an existing budget database.') do |database|
      options[:load] = database
      puts "Loading #{database}"
    end
  end

  def self.version(parser)
    parser.on('-v', '--version', 'Print the app version.') do
      puts VERSION
      exit
    end
  end
end
