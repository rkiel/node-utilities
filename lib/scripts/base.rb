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
      heading = 'script'
      width = keys.reduce(heading.length) do |accumulator, element|
        accumulator > element.size ? accumulator : element.size
      end

      fmt  = " %-#{width}.#{width}s %s"
      
      puts
      puts fmt % ['script', 'command(s)']
      puts fmt % ['------', '----------']
      keys.each do |key|
        puts fmt % [key, scripts[key]]
      end
      puts
    end

    def write ( json )
      File.write('package.json', JSON.pretty_generate(json))
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
