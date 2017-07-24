require 'json'
require_relative './base'

module Scripts

  class Add < Scripts::Base
    def valid?
      argv.size > 3 and argv[2] == 'as'
    end

    def help
      "#{script_name} add [name] as [words...[then||and||or]]"
    end

    def sub_execute(json)
      argv.shift # add
      key = argv.shift # key
      argv.shift # as
      value = argv


      value = value.map {|x| ['then'].include?(x)? '; ' : x}
      value = value.map {|x| ['and'].include?(x) ? '&&' : x}
      value = value.map {|x| ['or'].include?(x) ? '||' : x}
      value = value.map {|x| ['pipe'].include?(x)? ' | ' : x}
      value = value.join(' ')

      json["scripts"][key] = value

      write json

      puts
      puts " ADDED #{key}"

      sort json["scripts"]
    end
  end

end
