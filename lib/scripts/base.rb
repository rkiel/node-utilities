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

    def sort ( scripts, pattern )
      # build all the non pre/post scripts
      new_scripts = scripts.keys.reduce({}) do |object,key|
        if (pattern.match(key))
          if key.start_with? "pre" and scripts[key.sub(/^pre/,'')]
            object
          elsif key.start_with? "post" and scripts[key.sub(/^post/,'')]
            object
          else
            object[key] = {
              name: key,
              value: scripts[key],
              length: key.length
            }
            object
          end
        else
          object
        end
      end

      # fill in the pre/post scripts
      new_scripts = scripts.keys.reduce(new_scripts) do |object,key|
        if (pattern.match(key))
          if key.start_with? "pre" and scripts[key.sub(/^pre/,'')]
            subkey = key.sub(/^pre/,'')
            label = '  pre'
            object[subkey][:length] = [object[subkey][:length], label.length].max
            object[subkey][:pre] = {
              name: label,
              value: '  ' + scripts[key]
            }
            object
          elsif key.start_with? "post" and scripts[key.sub(/^post/,'')]
            subkey = key.sub(/^post/,'')
            label = '  post'
            object[subkey][:length] = [object[subkey][:length], label.length].max
            object[subkey][:post] = {
              name: label,
              value: '  ' + scripts[key]
            }
            object
          else
            object
          end
        else
          object
        end
      end

      keys = new_scripts.keys.sort_by(&:downcase)

      heading = 'script'
      width = new_scripts.keys.map {|key| new_scripts[key][:length]}.max
      width = [heading.size, width].max

      fmt  = " %-#{width}.#{width}s %s"

      puts
      puts fmt % ['script', 'command(s)']
      puts fmt % ['------', '----------']
      keys.each do |key|
        script = new_scripts[key]
        pre = script[:pre]
        post = script[:post]

        puts fmt % [script[:name], script[:value]]
        puts fmt % [pre[:name], pre[:value]] if pre
        puts fmt % [post[:name], post[:value]] if post
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
