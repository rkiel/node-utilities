require 'json'
require_relative './base'

module Scripts

  class Init < Scripts::Base
    def valid?
      true
    end

    def help
      "scripts init"
    end

    def execute
      if File.exist? 'package.json'
        json = JSON.parse(File.read('package.json'))
        puts 'reading package.json'
      else
        json = {
          name: File.basename(Dir.pwd),
          version: "1.0.0",
          main: "index.js",
        #  repository: "git@github.com:rkiel/node-utilities.git",
        #  author: "rkiel <cygnus@pobox.com>",
          license: "MIT"
        }
        File.write('package.json', JSON.pretty_generate(json))
        puts 'creating package.json'
      end

      if not json["scripts"]
        json["scripts"] = {}
        File.write('package.json', JSON.pretty_generate(json))
        puts 'updating package.json'
      end
    end
  end

end
