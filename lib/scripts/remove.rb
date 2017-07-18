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

    def sub_execute ( json )
      argv.shift # remove`
      key = argv.shift # key

      json["scripts"].delete key
      File.write('package.json', JSON.pretty_generate(json))

      sort json["scripts"]
    end
  end

end
