Pry.config.pager = false
Pry.config.editor = proc { |file, line| "emacsclient #{file} +#{line}" }
