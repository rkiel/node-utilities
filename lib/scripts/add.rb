require 'json'
require_relative './base'

module Scripts

  class Add < Scripts::Base
    def valid?
      argv.size > 3 and argv[2] == 'as'
    end

    def help
      "scripts add [name] as [words...]"
    end

    def sub_execute(json)
      argv.shift # add
      key = argv.shift # key
      argv.shift # as
      value = argv


      value = value.map {|x| ['then'].include?(x)? ';' : x}
      value = value.map {|x| ['and'].include?(x) ? '&&' : x}
      value = value.map {|x| ['or'].include?(x) ? '||' : x}
      value = value.join(' ')

      json["scripts"][key] = value
      File.write('package.json', JSON.pretty_generate(json))

      sort json["scripts"]
    end
  end

end
