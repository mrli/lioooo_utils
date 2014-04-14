#encoding: utf-8
require 'socket'
Server = UDPSocket.open { |s| s.connect('64.233.187.99', 1); s.addr.last }
class LiooooUtils
  class << self
    def build_log_dir source, target
      cmd = "ln -sf #{source} #{target}"
      ShellExec.exec! cmd
    end

    # check if is development mac
    def is_dev?
      Server =~/^192.168/
    end
  end
end