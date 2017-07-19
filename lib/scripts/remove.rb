require 'json'
require_relative './base'

module Scripts

  class Remove < Scripts::Base
    def valid?
      argv.size == 2
    end

    def help
      "#{script_name} remove [name]"
    end

    def sub_execute ( json )
      argv.shift # remove`
      key = argv.shift # key

      scripts = json["scripts"]

      if scripts[key]
        scripts.delete key

        write json

        puts
        puts " REMOVED #{key}"

        sort scripts
      else
        puts
        puts " NOT FOUND #{key}"

        sort scripts
      end

    end
  end

end
