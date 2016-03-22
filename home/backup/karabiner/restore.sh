#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.backslash2delete 1
/bin/echo -n .
$cli set repeat.initial_wait 250
/bin/echo -n .
$cli set remap.delete2backslash 1
/bin/echo -n .
/bin/echo
