require_relative './base'
require_relative './commander'
require_relative './loader'

module Scripts

  class Help < Scripts::Base

    COMMANDS = Scripts::Commander::COMMANDS
    DEFAULT  = Scripts::Commander::DEFAULT

    def valid?
      true
    end

    def help
      "scripts help"
    end

    def execute
      puts
      loader = Scripts::Loader.new(COMMANDS,DEFAULT)
      loader.create_all(argv).each do |cmd|
        puts cmd.help
      end
      puts
    end
  end

end
