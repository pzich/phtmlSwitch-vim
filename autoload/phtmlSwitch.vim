" Autoload script, see plugin file for more information

" Check for duplicate instances
if exists("g:loaded_phtmlSwitch")
	finish
endif
let g:loaded_phtmlSwitch = 1

augroup phtmlSwitch
	" Call linemove on cursor move events in PHP files
	autocmd CursorMoved,CursorMovedI *.php call phtmlSwitch#linemove()

	" Call linemove on opening file PHP files
	autocmd BufRead *.php call phtmlSwitch#linemove()
augroup END
