# Beginning of the el4r block:
# RCtool generated this block automatically. DO NOT MODIFY this block!
# This is the el4r initialization file.
# End of the el4r block.
# User-setting area is below this line.
$LOAD_PATH.unshift "~/projects/experiment/xiki/lib"   # <- substitute (xiki directory) with the output of "xiki directory"
require 'xiki'
Xiki.init

KeyBindings.keys   # Use default key bindings
Themes.use "Default"  # Use xiki theme
