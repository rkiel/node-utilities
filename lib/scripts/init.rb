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
      #git_show_branches
    end
  end

end
