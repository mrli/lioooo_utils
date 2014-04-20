#encoding: utf-8
require 'socket'
require 'rbconfig'
class LiooooUtils

  LiooooUtilsServer = UDPSocket.open { |s| s.connect('64.233.187.99', 1); s.addr.last }

  class << self
    def build_log_dir source, target
      cmd = "ln -sf #{source} #{target}"
      ShellExec.exec! cmd
    end

    ###################################### check if is development mac
    def is_dev?
      LiooooUtilsServer =~/^192.168/
    end


    ###################################### get os type
    def os
      host_os = RbConfig::CONFIG['host_os']
      case host_os
        when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
          :windows
        when /darwin|mac os/
          :macosx
        when /linux/
          :linux
        when /solaris|bsd/
          :unix
        else
          raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
      end
    end

    def is_mac?
      os == :macosx
    end

    def is_linux?
      os == :linux
    end

    def is_win?
      os == :windows
    end

    ##################################### get the os user name
    def username
      ENV['USER']
    end

  end
end
#puts LiooooUtils.username
#puts LiooooUtils.is_mac?
#puts LiooooUtils.is_linux?
#puts LiooooUtils.os