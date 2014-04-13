#encoding: utf-8
require 'colored'
require 'logging'
LogRoot = File.expand_path("../../log", __FILE__)
class LiooooUtilsLogger
  attr_accessor :logger

  def initialize type
    init_log_dir
    path = File.expand_path("#{LogRoot}/#{type}_log.log", __FILE__)
    @logger = Logging.logger["Lioooo#{type.upcase}Log"]
    @logger.add_appenders(
        Logging.appenders.stdout,
        Logging.appenders.file(path)
    )
    logger.level = :debug
  end

  def prefix fix
    path = File.expand_path("#{LogRoot}/#{fix}_log.log", __FILE__)
    @logger.add_appenders(
        Logging.appenders.stdout,
        Logging.appenders.file(path)
    )
  end

  # liooo_link_log_dir require log directory
  def init_log_dir
    cmd = "mkdir -p #{LogRoot}"
    system cmd unless File.exist? LogRoot
  end

  # puts log with error prefix
  def error msg
    msg = "#{msg}"
    @logger.error msg.red
  end

  # puts log with info prefix
  def info msg
    @logger.info msg
  end

  def warn msg
    msg = "#{msg} "
    @logger.warn msg.blue
  end

  def debug msg
    msg = "#{msg}"
    @logger.debug msg.yellow
  end

  def shell msg
    msg = "\n #{msg}"
    @logger.debug msg.white_on_black
  end

  # formate log timestamp
  def split
    msg = Time.now.strftime("%Y-%m-%d [ %H:%M:%S ]").to_s.center 100, '-'
    @logger.info msg.blue
  end

end

#custom call system shell script
class ShellExec
  def self.exec! cmd
    LiooooLogger.shell cmd
    system "source ~/.bash_profile && #{cmd}"
  end
end

LiooooLogger = LiooooUtilsLogger.new :lioooo







