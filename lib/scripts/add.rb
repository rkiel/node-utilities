require 'json'
require_relative './base'

module Scripts

  class Add < Scripts::Base
    def valid?
      argv.size > 3
    end

    def help
      "scripts add [name] as [words...]"
    end

    def execute
      if File.exist? 'package.json'
        json = JSON.parse(File.read('package.json'))

        if json["scripts"]

          argv.shift # add
          key = argv.shift # key
          argv.shift # as
          value = argv.join(' ')

          json["scripts"][key] = value
          File.write('package.json', JSON.pretty_generate(json))
          json["scripts"].keys.sort.each do |key|
            puts '%-15.15s %s' % [key, json["scripts"][key]]
          end
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
