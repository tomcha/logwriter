require "logwriter/version"

module Logwriter
  class Logger
    def initialize(logfile)
      if File.exist?(logfile)
        File.open(logfile, 'a') do |io|
          io.print "\n\n"
          day = Time.now
          io.print "#{day.inspect}\n"
        end
      else
        File.open(logfile, 'w') do |io|
          day = Time.now
          io.print "#{day.inspect}\n"
        end
      end
      @logfile = logfile
    end

    def rec_val(target, valiable_name = 'value')
      File.open(@logfile, 'a') do |io|
        io.print "#{valiable_name}: "
        io.print "#{target.inspect}\n"
      end
    end

    def rec_class(target)
      File.open(@logfile, 'a') do |io|
        io.puts "objectname: #{target.to_str}, class: #{target.class.to_str}, super_class: #{target.super.class.to_str}"
      end
    end

    def put_flag(flg_number)
      File.open(@logfile, 'a') do |io|
        io.puts "/~~  flaged  #{flg_number}"
      end
    end
  end
end
