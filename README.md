lioooo_utils

This Gem i use it in my work. it have collect code list or common script. 

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

#### you can check is runtime machine in lan
```
require 'lioooo_utils'

LiooooLogger.is_dev? # this will check runtime machine in lan return ***0*** or ***nil***

```
