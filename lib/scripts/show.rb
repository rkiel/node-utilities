require 'json'
require_relative './base'
require_relative './list'

module Scripts

  class Show < Scripts::List
    def help
      "#{script_name} show (alias for list)"
    end
  end

end
