require 'json'
require_relative './base'

module Scripts

  class Remove < Scripts::Base
    def valid?
      argv.size == 2
    end

    def help
      "scripts remove [name]"
    end

    def execute
      if File.exist? 'package.json'
        json = JSON.parse(File.read('package.json'))

        if json["scripts"]

          argv.shift # remove`
          key = argv.shift # key

          json["scripts"].delete key
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
