#require_relative '../shared/branchability'
#require_relative '../shared/runnable'

module Scripts

  class Base

#    include Shared::Branchability
#    include Shared::Runnable

    attr_reader :argv

    def initialize (argv)
      @argv = argv
    end

    def help
      "TBD"
    end

    def usage
      puts
      puts "USAGE: #{help}"
      puts
      exit
    end

    def sort ( scripts )
      keys = scripts.keys.sort_by(&:downcase)
      keys.each do |key|
        puts ' %-30.30s %s' % [key, scripts[key]]
      end
    end

    def execute
      if File.exist? 'package.json'
        json = JSON.parse(File.read('package.json'))

        if json["scripts"]

          sub_execute json

        else
          puts 'scripts is not defined in package.json'
          puts 'scripts init'
        end

      else
        puts 'package.json does not exist'
        puts 'scripts init'
      end
    end
  end

end
