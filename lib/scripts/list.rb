require 'json'
require_relative './base'

module Scripts

  class List < Scripts::Base
    def valid?
      argv.size > 0
    end

    def help
      "#{script_name} list [pattern]"
    end

    def sub_execute ( json )
      pattern = argv.size == 1 ? /.+/ : Regexp.new(argv[1],Regexp::IGNORECASE)
      sort json["scripts"], pattern
    end
  end

end
