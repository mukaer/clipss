function! Clipss_Push()
	 let cmd = $CLIPSS_PATH . "/push.sh"
	 call system(cmd ,@")
endfunction


function! Clipss_Pop()
	 let cmd = $CLIPSS_PATH . "/pop.sh"
	 let res =  system(cmd)
	 call append(line("."),split(res,'\n'))
endfunction