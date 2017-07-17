require 'json'
require_relative './base'

module Scripts

  class List < Scripts::Base
    def valid?
      argv.size == 1
    end

    def help
      "scripts list"
    end

    def execute
      if File.exist? 'package.json'
        json = JSON.parse(File.read('package.json'))

        if json["scripts"]
          json["scripts"].keys.sort.each do |key|
            puts '%-30.30s %s' % [key, json["scripts"][key]]
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
