# frozen-string-literal: true

# All the options for this app are defined here
module AppOptions
  def self.help(parser)
    parser.on('-h', '--help', 'Print this help.') do
      puts parser
      exit
    end
  end
end
