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

      json["scripts"].delete key

      write json

      puts
      puts " REMOVED #{key}"

      sort json["scripts"]
    end
  end

end
