require "logwriter/version"

module Logwriter
  class Logger
    attr_reader :target_filepath

    def initialize(path_string)
      @target_filepath = path_string
      File.open(target_filepath, 'a') do |io|
        io.print "\n#{Time.now.inspect}\n" 
      end
    end

    def rec_val(target_object, valiable_name = 'value')
      File.open(@target_filepath, 'a') do |io|
        io.print "#{valiable_name}: "
        io.print "#{target_object.inspect}\n"
      end
    end

    def rec_class(target_object)
      File.open(@target_filepath, 'a') do |io|
        io.puts "object: #{target_object}, class: #{target_object.class}, superclass: #{target_object.class.superclass}"
      end
    end

    def put_flag(flg_number)
      File.open(@target_filepath, 'a') do |io|
        io.puts "/~~  #{flg_number} flaged  "
      end
    end
  end
end
