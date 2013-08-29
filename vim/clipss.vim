function! Clipss_Push()
	 let cmd = $CLIPSS_PATH . "/bin/clipss_push"
	 call system(cmd ,@")
endfunction

function! Clipss_Pop()
	 let cmd = $CLIPSS_PATH . "/bin/clipss_pop"
	 let res = system(cmd)
	 call append(line("."),split(res,'\n'))
endfunction
