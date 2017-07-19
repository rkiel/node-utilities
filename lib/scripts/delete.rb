require 'json'
require_relative './base'
require_relative './remove'

module Scripts

  class Delete < Scripts::Remove
    def help
      "#{script_name} delete [name] (alias for remove)"
    end
  end

end
