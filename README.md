phtmlSwitch.vim
===============

Vim plugin for automatically switching between HTML and PHP filetypes in PHP files.

Settings
--------
`g:phtmlSwitch_enabled` (Default: 1)
Enables phtmlSwitch, this can be used in key mappings to
temporarily disable phtmlSwitch if it is behaving incorrectly or
is not needed.

`g:phtmlSwitch_php_type` (Default: "php")
Allows you to change what phtmlSwitch sets as the filetype when it
hits a PHP block. This is useful if you have a custom filetype
that you want to use.

`g:phtmlSwitch_html_type` (Default: "html")
Allows you to change what phtmlSwitch sets as the filetype when it
hits a HTML block. This is useful if you have a custom filetype
that you want to use.

`g:phtmlSwitch_debug` (Default: 0)
Echoes which code region phtmlSwitch thinks the cursor is in
(PHP/HTML). This is helpful for debugging issues with the search
function powering the filetype switcher. Turn this on if things
are behaving strangely.

Functions
---------
These functions are provided to extend or modify how phtmlSwitch
works.

`phtmlSwitch#update()`
Runs the code block checker again and sets the file type.

`phtmlSwitch#toggle()`
Toggles between HTML and PHP modes.

`phtmlSwitch#setPHP()`
Sets the mode to PHP.

`phtmlSwitch#setHTML()`
Sets the mode to HTML.

Note
----
This script is currently very poorly checking for PHP blocks,
If you put `<?php`, `<?=`, `<?` or `?>` in a string it will get
confused. This may be fixed in a future version, but for now
this keeps things lightweight. This is my first vim plugin, I
hope it helps you. If you have comments or suggestions please
let me know.

Issues
------
* Opening and closing PHP tags in strings will throw off the code block parser (noted in the notes).
* Currently the opening PHP tag is considered PHP and the closing tag is HTML (just how the regex and search() work right now), not really an issue but should probably be consistent.
* Filetype switching will not be enabled for files without a .php extension, regardless of what the filetype is set to (this includes new buffers).
