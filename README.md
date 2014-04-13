== lioooo_utils

#### How to use it

`gem install lioooo_utils`

```
require 'lioooo_utils'

LiooooLogger = LiooooUtilsLogger.new :lioooo,'/tmp' #new instance with log parent directory '/tmp/lioooo_log.log'

LiooooLogger.info '--> it's ok with lioooo_utils' # will log to /tmp/lioooo_log.log log file

```

#### you can call shell command
like this:

```
require 'lioooo_utils'

LiooooLogger = LiooooUtilsLogger.new :lioooo,'/tmp' #new instance with log parent directory '/tmp/lioooo_log.log'

LiooooLogger.shell_exec! 'echo ok' # this will can shell `echo` command

```
