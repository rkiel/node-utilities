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

    def script_name
      "sc"
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
      new_scripts = scripts.keys.reduce({}) do |object,key|
        if key.start_with? "pre" and scripts[key.sub(/^pre/,'')]
          object
        elsif key.start_with? "post" and scripts[key.sub(/^post/,'')]
          object
        else
          object[key] = {
            name: key,
            length: key.length
          }
          object
        end
      end
      new_scripts = scripts.keys.reduce(new_scripts) do |object,key|
        if key.start_with? "pre" and scripts[key.sub(/^pre/,'')]
          subkey = key.sub(/^pre/,'')
          object[subkey][:length] = object[subkey][:length] + 6
          object[subkey][:pre] = {
            name: '  pre',
            value: '  ' + scripts[key]
          }
          object
        elsif key.start_with? "post" and scripts[key.sub(/^post/,'')]
          subkey = key.sub(/^post/,'')
          object[subkey][:length] = object[subkey][:length] + 6
          object[subkey][:post] = {
            name: '  post',
            value: '  ' + scripts[key]
          }
          object
        else
          object
        end
      end

      keys = new_scripts.keys.sort_by(&:downcase)

      heading = 'script'
      width = keys.reduce(heading.length) do |accumulator, element|
        accumulator > element.size ? accumulator : element.size
      end

      fmt  = " %-#{width}.#{width}s %s"

      puts
      puts fmt % ['script', 'command(s)']
      puts fmt % ['------', '----------']
      keys.each do |key|
        puts fmt % [key, new_scripts[key][:name]]
        puts fmt % [new_scripts[key][:pre][:name], new_scripts[key][:pre][:value]] if new_scripts[key][:pre]
        puts fmt % [new_scripts[key][:post][:name], new_scripts[key][:post][:value]] if new_scripts[key][:post]
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
