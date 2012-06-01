"        File: phtmlSwitch.vim
"      Author: Peter Zich
"     Version: 1.0.0
"     WebPage: http://github.com/pzich/phtmlSwitch-vim
" Description: Switches filetypes depending on where the cursor is
"              relative to PHP blocks.


if !exists("g:phtmlSwitch_debug")
	let g:phtmlSwitch_debug = 0
endif

if !exists("g:phtmlSwitch_enabled")
	let g:phtmlSwitch_enabled = 1
endif

if !exists("g:phtmlSwitch_php_type")
	let g:phtmlSwitch_php_type = "php"
endif

if !exists("g:phtmlSwitch_html_type")
	let g:phtmlSwitch_html_type = "html"
endif

let s:ft = ""
function! phtmlSwitch#linemove()
	if !g:phtmlSwitch_enabled
		finish
	endif
	call phtmlSwitch#update()
endfunction

function! phtmlSwitch#update()
	let n = search('\(<?php\)\|\(<?\)\|\(<?=\)\|\(?>\)', 'Wbcnp')
	if n >= 2 && n <= 4 " PHP
		if g:phtmlSwitch_debug
			echo "PHP"
		endif
		call phtmlSwitch#setPHP()
	else " HTML
		if g:phtmlSwitch_debug
			echo "HTML"
		endif
		call phtmlSwitch#setHTML()
	endif
endfunction

function! phtmlSwitch#toggle()
	if s:ft == g:phtmlSwitch_html_type
		call phtmlSwitch#setPHP()
	else
		call phtmlSwitch#setHTML()
	endif
endfunction

function! phtmlSwitch#setPHP()
	let ft = g:phtmlSwitch_php_type
	if s:ft != ft
		let s:ft = ft
		execute "setlocal ft=".s:ft
	endif
endfunction


function! phtmlSwitch#setHTML()
	let ft = g:phtmlSwitch_html_type
	if s:ft != ft
		let s:ft = ft
		execute "setlocal ft=".s:ft
	endif
endfunction
