require_relative './loader'

module Scripts

  class Commander

    COMMANDS = [
      :add,
      :init,
      :list,
      :help,
      :remove,
      :tab
    ].sort

    DEFAULT = :help

    attr_reader :subcommand

    def initialize (argv)
      key = (argv[0] ? argv[0].to_sym : :branch)
      @subcommand = Scripts::Loader.new(COMMANDS,DEFAULT).create(key,argv)
    end

    def valid?
      subcommand.valid?
    end

    def usage
      subcommand.usage
    end

    def execute
      subcommand.execute
    end

  end

end
