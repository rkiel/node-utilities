require 'json'
require_relative './base'

module Scripts

  class List < Scripts::Base
    def valid?
      argv.size == 1
    end

    def help
      "#{script_name} list"
    end

    def sub_execute ( json )
      sort json["scripts"]
    end
  end

end
